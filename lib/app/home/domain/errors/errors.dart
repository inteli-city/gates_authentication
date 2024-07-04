import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';

class InvalidParams extends Failure {
  InvalidParams({
    required super.stackTrace,
    required super.errorMessage,
  });
}
