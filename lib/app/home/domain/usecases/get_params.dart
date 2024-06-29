import 'package:dartz/dartz.dart';
import 'package:gates_authentication/app/home/domain/entities/params.dart';
import 'package:gates_authentication/app/home/domain/errors/errors.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';

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
      return Left(InvalidParams(
        errorMessage: params.paramsRequiredMessage,
        stackTrace: StackTrace.current,
      ));
    }
    return Right(params);
  }
}
