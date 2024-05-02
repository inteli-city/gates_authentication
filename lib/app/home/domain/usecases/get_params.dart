import 'package:dartz/dartz.dart';
import 'package:gates_authentication/app/home/domain/entities/params.dart';
import 'package:gates_authentication/app/home/domain/errors/errors.dart';

import '../repositories/uri_repository.dart';

abstract class GetParams {
  Either<Failure, Params> call();
}

class GetParamsImpl implements GetParams {
  final UriRepository repository;

  GetParamsImpl(this.repository);
  @override
  Either<Failure, Params> call() {
    final params = repository.getParams();
    if (!params.isValidParams) {
      return Left(InvalidParams(params.paramsRequiredMessage));
    }
    return Right(params);
  }
}
