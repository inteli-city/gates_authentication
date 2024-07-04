import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gates_microapp_flutter/core/auth_controller.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var authStore = Modular.get<AuthController>();
    if (authStore.user != null) {
      options.headers['Authorization'] = 'Bearer ${authStore.user!.idToken}';
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // err.response?.statusCode == 401 ? Modular.to.navigate('/login') : null;
    return handler.next(err);
  }
}
