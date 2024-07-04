import 'package:dartz/dartz.dart';

import 'package:gates_microapp_flutter/domain/repositories/auth_repository_interface.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';

abstract class IResetPasswordUsecase {
  Future<Either<Failure, Unit>> call({required String email});
}

class ResetPasswordImpl implements IResetPasswordUsecase {
  final IAuthRepository _repository;

  ResetPasswordImpl(this._repository);

  @override
  Future<Either<Failure, Unit>> call({required String email}) async {
    return await _repository.resetPassword(email: email);
  }
}
