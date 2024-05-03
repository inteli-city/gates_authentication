import 'package:flutter_modular/flutter_modular.dart';
import 'package:gates_authentication/app/home/domain/repositories/uri_repository.dart';
import 'package:gates_authentication/app/home/domain/usecases/get_params.dart';
import 'package:gates_authentication/app/home/domain/usecases/set_params.dart';
import 'package:gates_authentication/app/home/infra/repositories/uri_repository_impl.dart';
import 'package:gates_authentication/app/home/presenter/pages/home_page.dart';
import 'package:gates_authentication/app/home/presenter/stores/home_store.dart';
import 'package:gates_microapp_flutter/helpers/guards/admin_guard.dart';
import 'package:gates_microapp_flutter/helpers/guards/auth_guard.dart';
import 'package:gates_microapp_flutter/helpers/guards/login_guard.dart';
import 'package:gates_microapp_flutter/micro_app_admin_module.dart';
import 'package:gates_microapp_flutter/micro_app_auth_module.dart';
import 'package:gates_microapp_flutter/micro_app_login_module.dart';
import 'package:gates_microapp_flutter/presenter/ui/pages/user_home_page.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [MicroAppAuthModule()];

  @override
  void binds(i) {
    i.addSingleton<UriRepository>(UriRepositoryImpl.new);
    i.addLazySingleton<GetParams>(GetParamsImpl.new);
    i.addLazySingleton<SetParams>(SetParamsImpl.new);
    i.add(HomeStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
    r.child('/user',
        child: (context) => UserHomePage(
              onPressed: r.args.data[0] as Function(),
              email: r.args.data[1] as String,
            ),
        guards: [AuthGuard()]);
    r.module('/login', module: MicroAppLoginModule(), guards: [LoginGuard()]);
    r.module('/admin', module: MicroAppAdminModule(), guards: [AdminGuard()]);
  }
}
