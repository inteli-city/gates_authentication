import 'package:dartz/dartz.dart';

import 'package:gates_microapp_flutter/domain/repositories/auth_repository_interface.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';

abstract class IConfirmNewPasswordUsecase {
  Future<Either<Failure, Unit>> call(String newPassword);
}

class ConfirmNewPasswordUsecaseImpl implements IConfirmNewPasswordUsecase {
  final IAuthRepository _repository;

  ConfirmNewPasswordUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, Unit>> call(String newPassword) async {
    return await _repository.confirmNewPassword(newPassword: newPassword);
  }
}
