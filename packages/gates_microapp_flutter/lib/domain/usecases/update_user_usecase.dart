import 'package:dartz/dartz.dart';
import 'package:gates_microapp_flutter/domain/entities/user_info.dart';
import 'package:gates_microapp_flutter/domain/enum/role_enum.dart';

import 'package:gates_microapp_flutter/domain/repositories/auth_repository_interface.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';

abstract class IUpdateUserUsecase {
  Future<Either<Failure, UserInfo>> call({
    required String email,
    required String name,
    required RoleEnum role,
    required List<String> groups,
    required bool enabled,
  });
}

class UpdateUserUsecaseImpl implements IUpdateUserUsecase {
  final IAuthRepository _repository;

  UpdateUserUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, UserInfo>> call({
    required String email,
    required String name,
    required RoleEnum role,
    required List<String> groups,
    required bool enabled,
  }) async {
    return await _repository.adminUpdateUser(
      email: email,
      name: name,
      role: role,
      groups: groups,
      enabled: enabled,
    );
  }
}
