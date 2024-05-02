import 'package:gates_microapp_flutter/domain/errors/errors.dart';

class AuthError extends Failure {
  AuthError({required super.message});
}

class NewPasswordNecessaryError extends AuthError {
  NewPasswordNecessaryError() : super(message: 'Nova senha necessária');
}
