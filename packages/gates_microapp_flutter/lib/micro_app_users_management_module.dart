import 'package:flutter_modular/flutter_modular.dart';
import 'package:gates_microapp_flutter/domain/usecases/get_all_users_usecase.dart';
import 'package:gates_microapp_flutter/domain/usecases/list_users_in_group_usecase.dart';
import 'package:gates_microapp_flutter/helpers/guards/admin_collaborator_guard.dart';
import 'package:gates_microapp_flutter/micro_app_auth_module.dart';
import 'package:gates_microapp_flutter/presenter/controllers/admin/management_users_controller.dart';
import 'package:gates_microapp_flutter/presenter/ui/pages/admin/management_users_page.dart';

class MicroAppUsersManagementModule extends Module {
  final String _amplifyconfig;

  MicroAppUsersManagementModule(this._amplifyconfig);

  @override
  List<Module> get imports => [MicroAppAuthModule(_amplifyconfig)];

  @override
  void binds(i) {
    i.addLazySingleton<IListUsersInGroupUsecase>(
        ListUsersInGroupUsecaseImpl.new);
    i.addLazySingleton<IGetAllUsersUsecase>(GetAllUsersUsecaseImpl.new);
    i.addLazySingleton<ManagementUsersController>(
        ManagementUsersController.new);
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute,
        child: (context) => const ManagementUsersPage(),
        guards: [AdminCollaboratorGuard()]);
  }
}
