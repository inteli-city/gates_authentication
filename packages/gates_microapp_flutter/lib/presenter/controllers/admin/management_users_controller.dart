import 'package:gates_microapp_flutter/domain/usecases/get_all_users_usecase.dart';
import 'package:gates_microapp_flutter/presenter/states/management_group_state.dart';
import 'package:mobx/mobx.dart';

part 'management_users_controller.g.dart';

class ManagementUsersController = ManagementUsersControllerBase
    with _$ManagementUsersController;

abstract class ManagementUsersControllerBase with Store {
  final IGetAllUsersUsecase _getAllUser;

  ManagementUsersControllerBase(this._getAllUser) {
    getAllUsers();
  }

  @observable
  ManagementUsersState state = ManagementUsersInitialState();

  @action
  void setState(ManagementUsersState value) => state = value;

  @action
  Future<void> getAllUsers() async {
    setState(ManagementUsersLoadingState());
    final result = await _getAllUser.call();
    result.fold(
      (error) => setState(ManagementUsersErrorState(error: error)),
      (users) => setState(ManagementUsersSuccessState(users: users)),
    );
  }
}
