import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:gates_microapp_flutter/core/auth_controller.dart';
import 'package:gates_microapp_flutter/domain/enum/role_enum.dart';
import 'package:gates_microapp_flutter/micro_app_auth_module.dart';

class AdminGuard extends RouteGuard {
  AdminGuard({String? redirectTo}) : super(redirectTo: redirectTo ?? '/');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    if (authInjector.get<AuthController>().user == null) {
      return false;
    }
    return authInjector.get<AuthController>().isLogged &&
        (authInjector.get<AuthController>().user!.role ==
                RoleEnum.ADMIN_COLLABORATOR ||
            authInjector.get<AuthController>().user!.role ==
                RoleEnum.ADMIN_USER);
  }
}
