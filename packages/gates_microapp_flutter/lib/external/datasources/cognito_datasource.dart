import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:gates_microapp_flutter/domain/entities/logged_user_info.dart';
import 'package:gates_microapp_flutter/domain/entities/user_info.dart';
import 'package:gates_microapp_flutter/domain/enum/group_enum.dart';
import 'package:gates_microapp_flutter/domain/enum/role_enum.dart';
import 'package:gates_microapp_flutter/domain/errors/errors.dart';
import 'package:gates_microapp_flutter/infra/adapters/user_info_adapter.dart';
import 'package:gates_microapp_flutter/infra/datasource/auth_datasource_interface.dart';
import 'package:gates_microapp_flutter/shared/helpers/errors/errors.dart';
import 'package:gates_microapp_flutter/shared/helpers/network/http_clients/http_client.dart';
import 'package:gates_microapp_flutter/shared/helpers/network/model/http_client_error.dart';

class CognitoDatasource implements IAuthDatasource {
  final IHttpClient _httpClient;

  CognitoDatasource(this._httpClient);

  @override
  Future<LoggedUserInfo> loginEmail(
      {required String email, required String password}) async {
    await Amplify.Auth.signOut();
    final result = await Amplify.Auth.signIn(
      username: email,
      password: password,
    );
    final cognitoPlugin = Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey);
    final session = await cognitoPlugin.fetchAuthSession();
    if (result.nextStep.signInStep ==
        AuthSignInStep.confirmSignInWithNewPassword) {
      throw NewPasswordNecessaryError(
        stackTrace: StackTrace.current,
      );
    }
    final atribbutes = await Amplify.Auth.fetchUserAttributes();

    return LoggedUserInfo(
      email: email,
      userId: session.userSubResult.value,
      role: RoleEnum.stringToEnum(atribbutes
          .firstWhere((element) =>
              element.userAttributeKey.toString() == 'custom:general_role')
          .value),
      accessToken: session.userPoolTokensResult.value.accessToken.raw,
      name: session.userPoolTokensResult.value.idToken.name!,
      idToken: session.userPoolTokensResult.value.idToken.raw,
      refreshToken: session.userPoolTokensResult.value.refreshToken,
      groups: session.userPoolTokensResult.value.idToken.groups
          .map((e) => GroupEnum.stringToEnum(e))
          .toList(),
    );
  }

  @override
  Future<void> logout() async {
    final result = await Amplify.Auth.signOut();
    if (result is CognitoCompleteSignOut) {
    } else if (result is CognitoFailedSignOut) {
      throw LogoutError();
    }
  }

  @override
  Future<LoggedUserInfo> getLoggedUser() async {
    final cognitoPlugin = Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey);
    final session = await cognitoPlugin.fetchAuthSession();
    if (!session.isSignedIn) {
      throw AuthError(
        errorMessage: 'Usuário não logado',
        stackTrace: StackTrace.current,
      );
    }
    final atribbutes = await Amplify.Auth.fetchUserAttributes();
    return LoggedUserInfo(
      email: session.userPoolTokensResult.value.idToken.email!,
      userId: session.userSubResult.value,
      role: RoleEnum.stringToEnum(atribbutes
          .firstWhere((element) =>
              element.userAttributeKey.toString() == 'custom:general_role')
          .value),
      accessToken: session.userPoolTokensResult.value.accessToken.raw,
      name: session.userPoolTokensResult.value.idToken.name!,
      idToken: session.userPoolTokensResult.value.idToken.raw,
      refreshToken: session.userPoolTokensResult.value.refreshToken,
      groups: session.userPoolTokensResult.value.idToken.groups
          .map((e) => GroupEnum.stringToEnum(e))
          .toList(),
    );
  }

  @override
  Future<void> resetPassword({required String email}) async {
    await Amplify.Auth.resetPassword(username: email);
  }

  @override
  Future<void> confirmResetPassword(
      {required String email,
      required String code,
      required String newPassword}) async {
    await Amplify.Auth.confirmResetPassword(
        username: email, newPassword: newPassword, confirmationCode: code);
  }

  @override
  Future<void> confirmNewPassword({required String newPassword}) async {
    await Amplify.Auth.confirmSignIn(
      confirmationValue: newPassword,
    );
  }

  @override
  Future<void> adminCreateUser(
      {required String email,
      required String name,
      required RoleEnum role,
      required List<String> groups}) async {
    try {
      final data = {
        "email": email,
        "name": name,
        "role": role.name,
        "groups": groups
      };
      await _httpClient.post('/create-user', data: data);
    } on Failure catch (e, stackTrace) {
      if (e is TimeOutError) {
        throw NoInternetConnectionError();
      } else {
        throw CreateUserError(
          stackTrace: stackTrace,
          errorMessage: e.errorMessage,
        );
      }
    }
  }

  @override
  Future<List<UserInfo>> getListUsersInGroup({required String group}) async {
    try {
      final response = await _httpClient.post('/list-users-in-group', data: {
        "group": group,
      });

      return UserInfoAdapter.fromJsonList(response.data["users"]);
    } on Failure catch (e, stackTrace) {
      if (e is TimeOutError) {
        throw NoInternetConnectionError();
      } else {
        throw ListUsersError(
          stackTrace: stackTrace,
          errorMessage: e.errorMessage,
        );
      }
    }
  }

  @override
  Future<UserInfo> adminUpdateUser({
    required String email,
    required String name,
    required RoleEnum role,
    required List<String> groups,
    required bool enabled,
  }) async {
    try {
      final response = await _httpClient.post('/update-user', data: {
        "email": email,
        "name": name,
        "role": role.name,
        "groups": groups,
        "enabled": enabled,
      });

      return UserInfoAdapter.fromJson(response.data["user"]);
    } on Failure catch (e, stackTrace) {
      if (e is TimeOutError) {
        throw NoInternetConnectionError();
      } else {
        throw UpdateUserError(
          stackTrace: stackTrace,
          errorMessage: e.errorMessage,
        );
      }
    }
  }

  @override
  Future<List<UserInfo>> getAllUsers() async {
    try {
      final response = await _httpClient.get('/get-all-users');

      return UserInfoAdapter.fromJsonList(response.data["users"]);
    } on Failure catch (e, stackTrace) {
      if (e is TimeOutError) {
        throw NoInternetConnectionError();
      } else {
        throw ListUsersError(
          stackTrace: stackTrace,
          errorMessage: e.errorMessage,
        );
      }
    }
  }
}
