import 'package:dartz/dartz.dart';
import 'package:gates_authentication/app/home/domain/entities/params.dart';
import 'package:gates_authentication/app/home/domain/errors/errors.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';

import '../repositories/uri_repository.dart';

abstract class SetParams {
  Either<Failure, Unit> call(Uri uri);
}

class SetParamsImpl implements SetParams {
  final UriRepository repository;

  SetParamsImpl(this.repository);
  @override
  Either<Failure, Unit> call(Uri uri) {
    final params = Params.fromQueryParams(uri.queryParameters);

    if (!params.isValidParams) {
      return Left(InvalidParams(
        errorMessage: 'Invalid parameters',
        stackTrace: StackTrace.current,
      ));
    }
    repository.setParamsFromUri(params);
    return const Right(unit);
  }
}
