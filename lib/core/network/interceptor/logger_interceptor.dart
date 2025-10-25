import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// Custom Logger Interceptor to show request + response together
class LoggerInterceptor extends Interceptor {
  final Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      colors: false,
      printEmojis: true,
    ),
    output: DebugPrintOutput(),
  );

  String _prettyJson(dynamic data) {
    try {
      if (data is String) {
        // If it's already a JSON string, decode first
        final decoded = json.decode(data);
        return const JsonEncoder.withIndent('  ').convert(decoded);
      } else if (data is Map || data is List) {
        // Convert map/list directly
        return const JsonEncoder.withIndent('  ').convert(data);
      }
      return data.toString(); // fallback
    } catch (_) {
      return data.toString(); // not JSON
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final buffer = StringBuffer()
      ..writeln("➡️ ${options.method} Request")
      ..writeln("🔗 URI: ${options.uri}")
      ..writeln("📍 Endpoint: ${options.path}")
      ..writeln("📦 Headers: ${options.headers}");

    if (options.queryParameters.isNotEmpty) {
      buffer.writeln("❓ Query Params: ${options.queryParameters}");
    }

    if (options.data != null) {
      if (options.data is FormData) {
        final formData = options.data as FormData;
        final fields =
        formData.fields.map((e) => "${e.key}: ${e.value}").join(", ");
        final files = formData.files
            .map((f) => "${f.key}: ${f.value.filename}")
            .join(", ");
        buffer.writeln("📝 FormData Fields: {$fields}");
        if (formData.files.isNotEmpty) {
          buffer.writeln("📎 FormData Files: {$files}");
        }
      } else {
        buffer.writeln("📝 Body: ${_prettyJson(options.data)}");
      }
    }

    options.extra["requestLog"] = buffer.toString();
    options.extra["startTime"] = DateTime.now();
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final reqLog = response.requestOptions.extra["requestLog"] ?? "";
    final startTime = response.requestOptions.extra["startTime"] as DateTime?;
    final duration =
    startTime != null ? DateTime.now().difference(startTime) : null;

    final resLog = StringBuffer()
      ..writeln("⬅️ Response")
      ..writeln(
          "STATUS: ${response.statusCode} ${response.statusMessage}  ⏱️ ${duration?.inMilliseconds}ms")
      ..writeln("HEADERS: ${response.headers}")
      ..writeln("BODY:\n${_prettyJson(response.data)}");

    logger.i("$reqLog\n$resLog");
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final reqLog = err.requestOptions.extra["requestLog"] ?? "";
    final startTime = err.requestOptions.extra["startTime"] as DateTime?;
    final duration =
    startTime != null ? DateTime.now().difference(startTime) : null;

    final errorLog = StringBuffer()
      ..writeln("❌ ERROR  ⏱️ ${duration?.inMilliseconds}ms")
      ..writeln("TYPE: ${err.type}")
      ..writeln("MESSAGE: ${err.message}");

    if (err.response?.data != null) {
      errorLog.writeln("BODY:\n${_prettyJson(err.response?.data)}");
    }

    logger.e("$reqLog\n$errorLog");
    handler.next(err);
  }
}

/// Splits large logs into chunks to avoid truncation in debugPrint
class DebugPrintOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    const chunkSize = 800; // split big logs
    for (var line in event.lines) {
      if (line.length <= chunkSize) {
        debugPrint(line);
      } else {
        for (var i = 0; i < line.length; i += chunkSize) {
          debugPrint(line.substring(
              i, i + chunkSize > line.length ? line.length : i + chunkSize));
        }
      }
    }
  }
}
