import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:gates_microapp_flutter/core/auth_controller.dart';
import 'package:gates_microapp_flutter/domain/enum/role_enum.dart';

class AdminCollaboratorGuard extends RouteGuard {
  AdminCollaboratorGuard({String? redirectTo})
      : super(redirectTo: redirectTo ?? '/');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    if (Modular.get<AuthController>().user == null) {
      return false;
    }
    return Modular.get<AuthController>().isLogged &&
        Modular.get<AuthController>().user!.role == RoleEnum.ADMIN_COLLABORATOR;
  }
}
