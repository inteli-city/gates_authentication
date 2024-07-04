import 'package:gates_microapp_flutter/domain/entities/logged_user_info.dart';
import 'package:gates_microapp_flutter/domain/entities/user_info.dart';
import 'package:gates_microapp_flutter/domain/enum/role_enum.dart';

abstract class IAuthDatasource {
  Future<List<UserInfo>> getAllUsers();
  Future<LoggedUserInfo> loginEmail(
      {required String email, required String password});
  Future<void> confirmNewPassword({required String newPassword});
  Future<void> logout();
  Future<LoggedUserInfo> getLoggedUser();
  Future<void> resetPassword({required String email});
  Future<void> confirmResetPassword(
      {required String email,
      required String code,
      required String newPassword});
  Future<void> adminCreateUser({
    required String email,
    required String name,
    required RoleEnum role,
    required List<String> groups,
  });

  Future<List<UserInfo>> getListUsersInGroup({required String group});
  Future<UserInfo> adminUpdateUser({
    required String email,
    required String name,
    required RoleEnum role,
    required List<String> groups,
    required bool enabled,
  });
}
