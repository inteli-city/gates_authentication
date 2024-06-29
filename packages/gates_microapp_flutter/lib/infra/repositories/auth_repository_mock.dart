import 'package:dartz/dartz.dart';
import 'package:gates_microapp_flutter/domain/entities/logged_user_info.dart';
import 'package:gates_microapp_flutter/domain/entities/user_info.dart';
import 'package:gates_microapp_flutter/domain/enum/group_enum.dart';
import 'package:gates_microapp_flutter/domain/enum/role_enum.dart';
import 'package:gates_microapp_flutter/domain/enum/user_status_enum.dart';
import 'package:gates_microapp_flutter/domain/errors/errors.dart';
import 'package:gates_microapp_flutter/domain/repositories/auth_repository_interface.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';

class AuthRepositoryMock implements IAuthRepository {
  List<UserInfo> users = [
    UserInfo(
      email: 'admin@email.com',
      enabled: true,
      name: 'Admin',
      role: RoleEnum.ADMIN_COLLABORATOR,
      status: UserStatusEnum.CONFIRMED,
      userId: '1',
      groups: [
        GroupEnum.GAIA,
        GroupEnum.FORMULARIOS,
        GroupEnum.JUNDIAI,
      ],
    ),
    UserInfo(
      email: 'user@email.com',
      enabled: true,
      name: 'user',
      role: RoleEnum.USER,
      status: UserStatusEnum.CONFIRMED,
      userId: '2',
      groups: [
        GroupEnum.GAIA,
        GroupEnum.FORMULARIOS,
        GroupEnum.JUNDIAI,
      ],
    ),
  ];

  LoggedUserInfo? loggedUser;

  @override
  Future<Either<Failure, Unit>> adminCreateUser(
      {required String email,
      required String name,
      required RoleEnum role,
      required List<String> groups}) async {
    for (var user in users) {
      if (user.email == email) {
        return Left(CreateUserError(
          errorMessage: 'Usuário já cadastrado',
          stackTrace: StackTrace.current,
        ));
      }
    }

    List<GroupEnum> groupsEnum = groups
        .map((e) => GroupEnum.values
            .firstWhere((element) => element.name == e.toUpperCase()))
        .toList();

    users.add(UserInfo(
      email: email,
      enabled: true,
      name: name,
      role: role,
      status: UserStatusEnum.CONFIRMED,
      userId: '2',
      groups: groupsEnum,
    ));

    return const Right(unit);
  }

  @override
  Future<Either<Failure, UserInfo>> adminUpdateUser(
      {required String email,
      required String name,
      required RoleEnum role,
      required List<String> groups,
      required bool enabled}) async {
    for (var user in users) {
      if (user.email == email) {
        final userToUpdate = UserInfo(
          email: email,
          enabled: enabled,
          name: name,
          role: role,
          status: user.status,
          userId: user.userId,
          groups: groups
              .map((e) => GroupEnum.values
                  .firstWhere((element) => element.toString() == e))
              .toList(),
        );

        users.remove(user);

        users.add(userToUpdate);

        return Right(userToUpdate);
      }
    }

    return Left(UpdateUserError(
      errorMessage: 'Usuário não encontrado',
      stackTrace: StackTrace.current,
    ));
  }

  @override
  Future<Either<Failure, Unit>> confirmNewPassword(
      {required String newPassword}) async {
    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> confirmResetPassword(
      {required String email,
      required String code,
      required String newPassword}) async {
    return const Right(unit);
  }

  @override
  Future<Either<Failure, List<UserInfo>>> getAllUsers() async {
    return Right(users);
  }

  @override
  Future<Either<Failure, LoggedUserInfo>> getLoggedUser() async {
    if (loggedUser == null) {
      return Left(UserLoginError(
        errorMessage: 'Usuário não logado',
        stackTrace: StackTrace.current,
      ));
    }

    return Right(loggedUser!);
  }

  @override
  Future<Either<Failure, List<UserInfo>>> listUsersInGroup(
      {required String group}) async {
    final usersInGroup = users
        .where((element) => element.groups
            .any((element) => element.toString() == group.toUpperCase()))
        .toList();

    return Right(usersInGroup);
  }

  @override
  Future<Either<Failure, LoggedUserInfo>> loginEmail(
      {required String email, required String password}) async {
    for (var user in users) {
      if (user.email == email) {
        if (user.status == UserStatusEnum.FORCE_CHANGE_PASSWORD) {
          return Left(NewPasswordNecessaryError(
            stackTrace: StackTrace.current,
          ));
        }
        if (!user.enabled) {
          return Left(UserLoginError(
            errorMessage: 'Usuário desabilitado',
            stackTrace: StackTrace.current,
          ));
        }
        if (user.status == UserStatusEnum.CONFIRMED) {
          loggedUser = LoggedUserInfo(
            email: user.email,
            name: user.name,
            role: user.role,
            userId: user.userId,
            groups: user.groups,
            accessToken: '',
            refreshToken: '',
            idToken: '',
          );

          return Right(loggedUser!);
        }
      }
    }
    return Left(UserLoginError(
      errorMessage: 'Usuário não encontrado',
      stackTrace: StackTrace.current,
    ));
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    loggedUser = null;
    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> resetPassword({required String email}) async {
    return const Right(unit);
  }
}
