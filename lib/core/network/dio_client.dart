
import 'package:cifarx_task/core/constants/api_urls.dart';
import 'package:cifarx_task/core/error/failure.dart';
import 'package:cifarx_task/core/helpers/toast_notification/toast_notifications.dart';
import 'package:cifarx_task/core/network/interceptor/auth_interceptor.dart';
import 'package:cifarx_task/core/network/interceptor/logger_interceptor.dart';
import 'package:dio/dio.dart';


class DioClient {
  final Dio _dio;

  DioClient()
      : _dio = Dio(
    BaseOptions(
      baseUrl: ApiUrls.baseURL,
      contentType: "application/json; charset=UTF-8",
      responseType: ResponseType.json,
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      validateStatus: (status){

        if (status == null) return false;
        return (status >= 200 && status < 300);

      }
    ),
  ){
    _dio.interceptors.addAll([
      AuthInterceptor(dio: _dio),
      LoggerInterceptor(),
    ]);
  }

  Future<Response<T>> get<T>(
      String url, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) async {
    return _handleRequest(() => _dio.get<T>(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    ));
  }

  Future<Response<T>> post<T>(
      String url, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    return _handleRequest(() => _dio.post<T>(
      url,
      data: data,
      options: options,
      queryParameters: queryParameters,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    ));
  }

  Future<Response<T>> put<T>(
      String url, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    return _handleRequest(() => _dio.put<T>(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    ));
  }


  Future<Response<T>> patch<T>(
      String url, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    return _handleRequest(() => _dio.patch<T>(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    ));
  }

  Future<Response<T>> delete<T>(
      String url, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
      }) async {
    return _handleRequest(() => _dio.delete<T>(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    ));
  }


  Future<Response<T>> _handleRequest<T>(Future<Response<T>> Function() request) async {
    try {
      return await request();
    } on DioException catch (e) {
      throw dioExceptionToFailure(e);
    }
  }

  Failure dioExceptionToFailure(DioException e) {
    switch (e.type) {
      case DioExceptionType.badResponse:
          ToastNotifications.showApiErrorToast(
              e.response?.statusCode ?? 500, e.response?.data["message"]);
        return ApiFailure(
          e.response?.statusCode ?? 500,
          "${e.response?.data["message"]}",
        );
      case DioExceptionType.receiveTimeout:
        return NetworkFailure("Request timeout, please try again.");
      case DioExceptionType.cancel:
        return UnknownFailure("Request was cancelled.");
      case DioExceptionType.unknown:
      default:
        return UnknownFailure("Something went wrong. Please check your internet connection.");
    }
  }
}
