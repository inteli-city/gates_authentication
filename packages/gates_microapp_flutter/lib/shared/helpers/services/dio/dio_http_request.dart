import 'package:dio/dio.dart';
import 'package:gates_microapp_flutter/shared/helpers/services/dio/auth_interceptor.dart';
import 'package:gates_microapp_flutter/shared/helpers/services/dio/options/base_options.dart';

import '../http/http_request_interface.dart';

class DioHttpRequest implements IHttpRequest {
  final Dio _dio = Dio(baseOptions);

  @override
  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    _dio.interceptors.add(AuthInterceptor());
    return _dio.get(url, queryParameters: queryParameters);
  }

  @override
  Future<Response> post(String url, {dynamic data}) async {
    _dio.interceptors.add(AuthInterceptor());
    return _dio.post(url, data: data);
  }

  @override
  Future<Response> put(String url, {dynamic data}) async {
    _dio.interceptors.add(AuthInterceptor());
    return _dio.put(url, data: data);
  }
}
