import 'package:auto_injector/auto_injector.dart';
import 'package:gates_microapp_flutter/core/auth_controller.dart';
import 'package:gates_microapp_flutter/domain/repositories/auth_repository_interface.dart';
import 'package:gates_microapp_flutter/domain/usecases/get_logged_user_usecase.dart';
import 'package:gates_microapp_flutter/domain/usecases/logout_usecase.dart';
import 'package:gates_microapp_flutter/infra/datasource/auth_datasource_interface.dart';
import 'package:gates_microapp_flutter/shared/environments/environment_config.dart';
import 'package:gates_microapp_flutter/shared/helpers/network/http_clients/dio_http_client.dart';
import 'package:gates_microapp_flutter/shared/helpers/network/http_clients/http_client.dart';
import 'package:logger/logger.dart';
import 'external/datasources/cognito_datasource.dart';

final authInjector = AutoInjector();

void setupAuthInjector() {
  authInjector.addLazySingleton(AuthController.new);
  authInjector.addLazySingleton<IHttpClient>(DioHttpClient.new);
  authInjector.addLazySingleton(Logger.new);
  authInjector.addLazySingleton<IAuthDatasource>(CognitoDatasource.new);
  authInjector.addLazySingleton<IAuthRepository>(
      () => EnvironmentConfig.getAuthRepository());
  authInjector.addLazySingleton<IGetLoggedUserUsecase>(GetLoggedUserImpl.new);
  authInjector.addLazySingleton<ILogoutUsecase>(LogoutUsecaseImpl.new);
  authInjector.commit();
}
