import 'package:gates_microapp_flutter/domain/entities/user_info.dart';
import 'package:gates_microapp_flutter/domain/errors/errors.dart';

abstract class ManagementUsersState {
  const ManagementUsersState();
}

class ManagementUsersInitialState extends ManagementUsersState {}

class ManagementUsersLoadingState extends ManagementUsersState {}

class ManagementUsersErrorState extends ManagementUsersState {
  final Failure error;

  const ManagementUsersErrorState({required this.error});
}

class ManagementUsersSuccessState extends ManagementUsersState {
  final List<UserInfo> users;

  const ManagementUsersSuccessState({required this.users});
}
