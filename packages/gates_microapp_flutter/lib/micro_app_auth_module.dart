import 'package:flutter_modular/flutter_modular.dart';
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

class MicroAppAuthModule extends Module {
  @override
  void exportedBinds(i) {
    i.addLazySingleton(AuthController.new);
    i.addLazySingleton<IHttpClient>(DioHttpClient.new);
    i.addLazySingleton(Logger.new);
    i.add<IAuthDatasource>(CognitoDatasource.new);
    i.addLazySingleton<IAuthRepository>(
        () => EnvironmentConfig.getAuthRepository());
    i.addLazySingleton<IGetLoggedUserUsecase>(GetLoggedUserImpl.new);
    i.addLazySingleton<ILogoutUsecase>(LogoutUsecaseImpl.new);
  }
}
