
import 'package:cifarx_task/config/routes/app_routes.dart';
import 'package:cifarx_task/features/auth/presentation/pages/sign_in_page.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';

class QueuedRequest {
  final RequestOptions options;
  final ErrorInterceptorHandler handler;
  QueuedRequest(this.options, this.handler);
}

class AuthInterceptor extends Interceptor {
  bool isRefreshing = false;
  final List<QueuedRequest> queuedRequests = [];
  final Dio dio;

  AuthInterceptor({required this.dio});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {

    if(err.response?.statusCode == 403){
      await _forceSignOut();
      handler.reject(err);
    }
    handler.next(err); // non-401 errors

  }


  Future<void> _forceSignOut() async {
    queuedRequests.clear();
    navigatorKey.currentContext?.goNamed(SignInPage.name);
  }

}


