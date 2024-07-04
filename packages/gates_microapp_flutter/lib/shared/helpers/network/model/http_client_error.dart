import 'package:gates_microapp_flutter/generated/l10n.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';

class HttpClientError extends Failure {
  HttpClientError(String? message, {super.stackTrace})
      : super(
          errorMessage: message ?? S.current.unknownError,
        );
}

class TimeOutError extends Failure {
  TimeOutError(String? message, {super.stackTrace})
      : super(
          errorMessage: message ?? S.current.unknownError,
        );
}
