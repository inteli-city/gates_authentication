import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gates_microapp_flutter/core/auth_controller.dart';
import 'package:gates_microapp_flutter/helpers/functions/global_snackbar.dart';

class AuthInterceptor extends Interceptor {
  final AuthController authController = Modular.get();
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    await authController.checkLogin().then((value) {
      if (!value) {
        Modular.to.navigate('/');
        GlobalSnackBar.error('Sessão expirada, faça login novamente!');
      }
    });
    if (authController.user != null) {
      options.headers['Authorization'] =
          'Bearer ${authController.user!.idToken}';
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    (err.response?.statusCode == 401 || err.response?.statusCode == 403)
        ? Modular.to.navigate('/')
        : null;
    return handler.next(err);
  }
}
