import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:gates_microapp_flutter/core/auth_controller.dart';

class AuthGuard extends RouteGuard {
  AuthGuard({String? redirectTo}) : super(redirectTo: redirectTo ?? '/');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    return Modular.get<AuthController>().isLogged;
  }
}
