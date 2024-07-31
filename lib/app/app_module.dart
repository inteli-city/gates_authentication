import 'package:auto_injector/auto_injector.dart';
import 'package:flutter/material.dart';
import 'package:gates_authentication/app/home/domain/repositories/uri_repository.dart';
import 'package:gates_authentication/app/home/domain/usecases/get_params.dart';
import 'package:gates_authentication/app/home/domain/usecases/set_params.dart';
import 'package:gates_authentication/app/home/infra/repositories/uri_repository_impl.dart';
import 'package:gates_authentication/app/home/presenter/pages/home_page.dart';
import 'package:gates_authentication/app/home/presenter/stores/home_store.dart';
import 'package:gates_microapp_flutter/micro_app_auth_module.dart';
import 'package:gates_microapp_flutter/micro_app_login_module.dart';
import 'package:gates_microapp_flutter/presenter/ui/pages/login_page.dart';

import 'package:go_router/go_router.dart';

// @override
// List<Module> get imports => [MicroAppAuthModule()];

// @override
// void binds(i) {
//   i.addSingleton<UriRepository>(UriRepositoryImpl.new);
//   i.addLazySingleton<GetParams>(GetParamsImpl.new);
//   i.addLazySingleton<SetParams>(SetParamsImpl.new);
//   i.add(HomeStore.new);
// }

// @override
// void routes(r) {
//   r.child('/', child: (context) => const HomePage());
//   r.child('/user',
//       child: (context) => UserHomePage(
//             onPressed: r.args.data[0] as Function(),
//             email: r.args.data[1] as String,
//           ),
//       guards: [AuthGuard()]);
//   r.module('/login', module: MicroAppLoginModule(), guards: [LoginGuard()]);
//   r.module('/admin', module: MicroAppAdminModule(), guards: [AdminGuard()]);
// }

final injector = AutoInjector();

void setupInjector() {
  setupAuthInjector();
  setupLoginInjector();
  injector.addSingleton<UriRepository>(UriRepositoryImpl.new);
  injector.addLazySingleton<GetParams>(GetParamsImpl.new);
  injector.addLazySingleton<SetParams>(SetParamsImpl.new);
  injector.add(HomeStore.new);
  injector.commit();
}

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      // guards: [LoginGuard()],
    ),
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return Scaffold(body: child);
      },
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) {
            return const LoginPage();
          },
          // guards: [LoginGuard()],
        ),
      ],
    ),
  ],
);
