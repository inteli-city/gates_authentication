// ignore_for_file: constant_identifier_names

import 'package:flutter_modular/flutter_modular.dart';
import 'package:gates_microapp_flutter/domain/repositories/auth_repository_interface.dart';
import 'package:gates_microapp_flutter/infra/repositories/auth_repository_impl.dart';
import 'package:gates_microapp_flutter/infra/repositories/auth_repository_mock.dart';

class EnvironmentConfig {
  static const MSS_BASE_URL = String.fromEnvironment('MSS_BASE_URL');
  static const ENV = String.fromEnvironment(
    'ENV',
  );

  static IAuthRepository getAuthRepository() {
    if (ENV == 'LOCAL') {
      return AuthRepositoryMock();
    } else {
      return AuthRepositoryImpl(
        Modular.get(),
      );
    }
  }
}
