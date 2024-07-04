import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';

import '../../../generated/l10n.dart';

abstract class Failure implements Exception {
  String errorMessage;

  Failure({
    required this.errorMessage,
    StackTrace? stackTrace,
  }) {
    Modular.get<Logger>().e(
      errorMessage,
      time: DateTime.now(),
      error: this,
      stackTrace: stackTrace,
    );
  }
}

class LocalStorageFailure extends Failure {
  LocalStorageFailure({required String errorMessage})
      : super(
            errorMessage: S.current.localStorageErrorMessage('', errorMessage));
}

class NoInternetConnectionError extends Failure {
  NoInternetConnectionError()
      : super(errorMessage: S.current.noInternetConnectionErrorMessage);
}

class NoDataFound extends Failure {
  NoDataFound() : super(errorMessage: S.current.noDataFoundError);
}

class UnknownError extends Failure {
  final StackTrace? stackTrace;

  UnknownError({
    this.stackTrace,
  }) : super(
          stackTrace: stackTrace,
          errorMessage: S.current.unknownError,
        );
}

class AuthError extends Failure {
  AuthError({required super.errorMessage, required super.stackTrace});
}

class NewPasswordNecessaryError extends AuthError {
  NewPasswordNecessaryError({
    required super.stackTrace,
  }) : super(errorMessage: S.current.newPasswordNecessaryError);
}

class LogoutError extends Failure {
  LogoutError() : super(errorMessage: S.current.logoutError);
}
