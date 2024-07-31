import 'package:gates_microapp_flutter/core/auth_controller.dart';
import 'package:gates_microapp_flutter/domain/enum/role_enum.dart';
import 'package:gates_microapp_flutter/domain/usecases/admin_create_user_usecase.dart';
import 'package:gates_microapp_flutter/generated/l10n.dart';
import 'package:gates_microapp_flutter/micro_app_auth_module.dart';
import 'package:gates_microapp_flutter/shared/helpers/functions/global_snackbar.dart';
import 'package:gates_microapp_flutter/presenter/states/basic_state.dart';
import 'package:mobx/mobx.dart';

part 'create_user_controller.g.dart';

class CreateUserController = CreateUserControllerBase
    with _$CreateUserController;

abstract class CreateUserControllerBase with Store {
  var authController = authInjector.get<AuthController>();
  final IAdminCreateUserUsecase _adminCreateUser;

  CreateUserControllerBase(this._adminCreateUser);

  @observable
  BasicState state = BasicInitialState();

  @action
  void setState(BasicState value) => state = value;

  Future<void> createUser(String email, String name, RoleEnum role,
      List<String> selectedGroups) async {
    setState(BasicLoadingState());
    final result = await _adminCreateUser(
        email: email, name: name, role: role, groups: selectedGroups);
    setState(result.fold((e) {
      GlobalSnackBar.error(e.errorMessage);
      return BasicErrorState(error: e);
    }, (_) {
      GlobalSnackBar.success(S.current.createUserSuccess);
      return BasicInitialState();
    }));
  }
}
