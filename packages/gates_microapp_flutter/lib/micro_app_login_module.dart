import 'package:auto_injector/auto_injector.dart';
import 'package:gates_microapp_flutter/domain/usecases/confirm_new_password_usecase.dart';
import 'package:gates_microapp_flutter/domain/usecases/confirm_reset_password.dart';
import 'package:gates_microapp_flutter/domain/usecases/login_with_email_usecase.dart';
import 'package:gates_microapp_flutter/domain/usecases/reset_password_usecase.dart';
import 'package:gates_microapp_flutter/presenter/controllers/confirm_reset_password_controller.dart';
import 'package:gates_microapp_flutter/presenter/controllers/forgot_password_controller.dart';
import 'package:gates_microapp_flutter/presenter/controllers/login_controller.dart';
import 'package:gates_microapp_flutter/presenter/controllers/login_new_password_controller.dart';
import 'package:gates_microapp_flutter/presenter/ui/pages/forgot_password_page.dart';
import 'package:gates_microapp_flutter/presenter/ui/pages/login_new_password_page.dart';
import 'package:gates_microapp_flutter/presenter/ui/pages/login_page.dart';
import 'package:gates_microapp_flutter/presenter/ui/pages/new_password_page.dart';
import 'package:go_router/go_router.dart';

List<RouteBase> loginRoutes = [
  GoRoute(
    path: '/login',
    builder: (context, state) {
      return const LoginPage();
    },
    // guards: [LoginGuard()],
  ),
  GoRoute(
    path: '/forgot-password/',
    builder: (context, state) {
      return const ForgotPasswordPage();
    },
    // guards: [LoginGuard()],
  ),
  GoRoute(
    path: '/new-password/',
    builder: (context, state) {
      return const NewPasswordPage();
    },
    // guards: [LoginGuard()],
  ),
  GoRoute(
    path: '/login-new-password/',
    builder: (context, state) {
      return const LoginNewPasswordPage();
    },
    // guards: [LoginGuard()],
  ),
];

final loginInjector = AutoInjector();

void setupLoginInjector() {
  loginInjector.add<LoginController>(LoginController.new);
  loginInjector
      .addLazySingleton<ILoginWithEmailUsecase>(LoginWithEmailImpl.new);
  loginInjector
      .addLazySingleton<ForgotPasswordController>(ForgotPasswordController.new);
  loginInjector.addLazySingleton<IResetPasswordUsecase>(ResetPasswordImpl.new);
  loginInjector.addLazySingleton<ConfirmResetPasswordController>(
      ConfirmResetPasswordController.new);
  loginInjector.addLazySingleton<LoginNewPasswordController>(
      LoginNewPasswordController.new);
  loginInjector.addLazySingleton<IConfirmResetPasswordUsecase>(
      ConfirmResetPasswordUsecaseImpl.new);
  loginInjector.addLazySingleton<IConfirmNewPasswordUsecase>(
      ConfirmNewPasswordUsecaseImpl.new);
  loginInjector.commit();
}
