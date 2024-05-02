import 'package:dartz/dartz.dart';
import 'package:gates_microapp_flutter/domain/entities/user_info.dart';
import 'package:gates_microapp_flutter/domain/errors/errors.dart';
import 'package:gates_microapp_flutter/domain/repositories/auth_repository_interface.dart';

abstract class IGetAllUsersUsecase {
  Future<Either<Failure, List<UserInfo>>> call();
}

class GetAllUsersUsecaseImpl implements IGetAllUsersUsecase {
  final IAuthRepository _repository;

  GetAllUsersUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, List<UserInfo>>> call() async {
    return await _repository.getAllUsers();
  }
}
