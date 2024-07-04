import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';

class CreateUserError extends Failure {
  CreateUserError({
    required super.stackTrace,
    required super.errorMessage,
  });
}

class ListUsersError extends Failure {
  ListUsersError({
    required super.stackTrace,
    required super.errorMessage,
  });
}

class UserLoginError extends Failure {
  UserLoginError({
    required super.stackTrace,
    required super.errorMessage,
  });
}

class UpdateUserError extends Failure {
  UpdateUserError({
    required super.stackTrace,
    required super.errorMessage,
  });
}
