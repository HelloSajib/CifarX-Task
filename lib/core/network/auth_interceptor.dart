
import 'package:dio/dio.dart';

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

    // const refreshEndpoint = "/api/v1/auth/refresh";
    //
    //
    // if (err.response?.statusCode == 401 && err.requestOptions.path != refreshEndpoint) {
    //   var result = await sl<GetSignInEntityUseCase>().call();
    //
    //   return result.fold(
    //         (failure) async {
    //       await _forceSignOut();
    //       handler.reject(err);
    //     },
    //         (signInEntity) async {
    //       if (signInEntity?.signInData?.refreshToken == null) {
    //         await _forceSignOut();
    //         handler.reject(err);
    //         return;
    //       }
    //
    //       String refreshToken = signInEntity!.signInData!.refreshToken!;
    //
    //       // If already refreshing, queue request + handler
    //       if (isRefreshing) {
    //         queuedRequests.add(QueuedRequest(err.requestOptions, handler));
    //         return;
    //       }
    //
    //       isRefreshing = true;
    //
    //       Map<String, dynamic> body = {"refreshToken": refreshToken};
    //       var refreshResult = await sl<RefreshTokenUseCase>().call(params: body);
    //
    //       return refreshResult.fold(
    //             (failure) async {
    //           await _forceSignOut();
    //           isRefreshing = false;
    //           handler.reject(err);
    //         },
    //             (newSignInEntity) async {
    //           await sl<SaveSignInEntityUseCase>().call(params: newSignInEntity);
    //           String? newToken = newSignInEntity.signInData?.token;
    //
    //           // Retry queued requests
    //           for (var queued in queuedRequests) {
    //             queued.options.headers["Authorization"] = "Bearer $newToken";
    //             try {
    //               final r = await dio.fetch(queued.options);
    //               queued.handler.resolve(r);
    //             } catch (e) {
    //               queued.handler.reject(e as DioException);
    //             }
    //           }
    //           queuedRequests.clear();
    //
    //           // Retry original failed request
    //           err.requestOptions.headers["Authorization"] = "Bearer $newToken";
    //           final freshResponse = await dio.fetch(err.requestOptions);
    //
    //           isRefreshing = false;
    //           handler.resolve(freshResponse);
    //         },
    //       );
    //     },
    //   );
    // }

    handler.next(err); // non-401 errors
  }

// Future<void> _forceSignOut() async {
//   queuedRequests.clear();
//   await sl<SignOutUseCase>().call();
//   navigatorKey.currentContext?.goNamed(SignInPage.name);
// }

}


