import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gates_microapp_flutter/domain/entities/logged_user_info.dart';
import 'package:gates_microapp_flutter/domain/entities/user_info.dart';
import 'package:gates_microapp_flutter/domain/enum/role_enum.dart';
import 'package:gates_microapp_flutter/domain/repositories/auth_repository_interface.dart';
import 'package:gates_microapp_flutter/generated/l10n.dart';
import 'package:gates_microapp_flutter/infra/datasource/auth_datasource_interface.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';
import 'package:logger/logger.dart';

class AuthRepositoryCognito implements IAuthRepository {
  final IAuthDatasource datasource;
  final Logger logger = Modular.get();

  AuthRepositoryCognito(this.datasource);

  @override
  Future<Either<Failure, LoggedUserInfo>> loginEmail(
      {required String email, required String password}) async {
    try {
      logger.i('AuthRepositoryImpl.loginEmail');
      final user =
          await datasource.loginEmail(email: email, password: password);
      return Right(user);
    } catch (e) {
      return left(_handleAmplifyError(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> confirmNewPassword(
      {required String newPassword}) async {
    try {
      await datasource.confirmNewPassword(newPassword: newPassword);
      return const Right(unit);
    } catch (e) {
      return left(_handleAmplifyError(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await datasource.logout();
      return const Right(unit);
    } catch (e) {
      return left(_handleAmplifyError(e));
    }
  }

  @override
  Future<Either<Failure, LoggedUserInfo>> getLoggedUser() async {
    try {
      final user = await datasource.getLoggedUser();
      return Right(user);
    } on Failure catch (e) {
      return Left(e);
    } on Exception catch (exception, stackTrace) {
      return Left(UnknownError(stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<Failure, Unit>> resetPassword({required String email}) async {
    try {
      await datasource.resetPassword(email: email);
      return const Right(unit);
    } catch (e) {
      return left(_handleAmplifyError(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> confirmResetPassword(
      {required String email,
      required String code,
      required String newPassword}) async {
    try {
      await datasource.confirmResetPassword(
          email: email, code: code, newPassword: newPassword);
      return const Right(unit);
    } catch (e) {
      return left(_handleAmplifyError(e));
    }
  }

  AuthError _handleAmplifyError(e) {
    logger.e(e);
    var stackTrace = StackTrace.current;
    if (e is InvalidParameterException) {
      return AuthError(
        errorMessage: S.current.authErrorsSchema('invalidParameter'),
        stackTrace: stackTrace,
      );
    } else if (e is LimitExceededException) {
      return AuthError(
        errorMessage: S.current.authErrorsSchema('limitExceeded'),
        stackTrace: stackTrace,
      );
    } else if (e is TooManyFailedAttemptsException) {
      return AuthError(
        errorMessage: S.current.authErrorsSchema('tooManyFailedAttempts'),
        stackTrace: stackTrace,
      );
    } else if (e is InvalidPasswordException) {
      return AuthError(
        errorMessage: S.current.authErrorsSchema('invalidPasswordException'),
        stackTrace: stackTrace,
      );
    } else if (e is UserNotFoundException) {
      return AuthError(
        errorMessage: S.current.authErrorsSchema('userNotFound'),
        stackTrace: stackTrace,
      );
    } else if (e is InternalErrorException) {
      return AuthError(
        errorMessage: S.current.authErrorsSchema('internalError'),
        stackTrace: stackTrace,
      );
    } else if (e is CodeMismatchException) {
      return AuthError(
        errorMessage: S.current.authErrorsSchema('codeMismatch'),
        stackTrace: stackTrace,
      );
    } else if (e is SignedOutException) {
      return AuthError(
        errorMessage: S.current.authErrorsSchema('signedOut'),
        stackTrace: stackTrace,
      );
    } else if (e is NotAuthorizedServiceException) {
      if (e.message.contains('password')) {
        return AuthError(
          errorMessage: S.current.authErrorsSchema('incorrectPassword'),
          stackTrace: stackTrace,
        );
      }
      return AuthError(
        errorMessage: S.current.authErrorsSchema('notAuthorized'),
        stackTrace: stackTrace,
      );
    } else if (e is UserNotConfirmedException) {
      return AuthError(
        errorMessage: S.current.authErrorsSchema('userNotConfirmed'),
        stackTrace: stackTrace,
      );
    } else if (e is UsernameExistsException) {
      return AuthError(
        errorMessage: S.current.authErrorsSchema('usernameExists'),
        stackTrace: stackTrace,
      );
    } else if (e is InvalidParameterException) {
      return AuthError(
        errorMessage: S.current.authErrorsSchema('invalidParameter'),
        stackTrace: stackTrace,
      );
    } else if (e is CodeDeliveryFailureException) {
      return AuthError(
        errorMessage: S.current.authErrorsSchema('codeDeliveryFailure'),
        stackTrace: stackTrace,
      );
    } else if (e is InvalidStateException) {
      return AuthError(
        errorMessage: S.current.authErrorsSchema('invalidStateException'),
        stackTrace: stackTrace,
      );
    } else if (e is NewPasswordNecessaryError) {
      return NewPasswordNecessaryError(
        stackTrace: stackTrace,
      );
    }
    return AuthError(
      errorMessage: S.current.authErrorsSchema('other'),
      stackTrace: stackTrace,
    );
  }

  @override
  Future<Either<Failure, Unit>> adminCreateUser(
      {required String email,
      required String name,
      required RoleEnum role,
      required List<String> groups}) async {
    try {
      await datasource.adminCreateUser(
          email: email, name: name, role: role, groups: groups);
      return const Right(unit);
    } on DioException catch (e) {
      return left(CreateUserError(
          errorMessage: e.response!.data, stackTrace: e.stackTrace));
    }
  }

  @override
  Future<Either<Failure, List<UserInfo>>> listUsersInGroup(
      {required String group}) async {
    try {
      var users = await datasource.getListUsersInGroup(group: group);
      return Right(users);
    } on DioException catch (e) {
      return left(ListUsersError(
          errorMessage: e.response!.data, stackTrace: e.stackTrace));
    }
  }

  @override
  Future<Either<Failure, UserInfo>> adminUpdateUser({
    required String email,
    required String name,
    required RoleEnum role,
    required List<String> groups,
    required bool enabled,
  }) async {
    try {
      return Right(await datasource.adminUpdateUser(
        email: email,
        name: name,
        role: role,
        groups: groups,
        enabled: enabled,
      ));
    } on DioException catch (e) {
      return left(UpdateUserError(
          errorMessage: e.response!.data, stackTrace: e.stackTrace));
    }
  }

  @override
  Future<Either<Failure, List<UserInfo>>> getAllUsers() async {
    try {
      return Right(await datasource.getAllUsers());
    } on DioException catch (e) {
      return left(ListUsersError(
          errorMessage: e.response!.data, stackTrace: e.stackTrace));
    }
  }
}
