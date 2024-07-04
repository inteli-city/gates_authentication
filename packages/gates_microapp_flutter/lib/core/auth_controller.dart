import 'package:gates_microapp_flutter/domain/entities/logged_user_info.dart';
import 'package:gates_microapp_flutter/domain/usecases/get_logged_user_usecase.dart';
import 'package:gates_microapp_flutter/domain/usecases/logout_usecase.dart';
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {
  final IGetLoggedUserUsecase _getLoggedUser;
  final ILogoutUsecase _logout;

  @observable
  LoggedUserInfo? user;

  AuthControllerBase(this._getLoggedUser, this._logout);

  @computed
  bool get isLogged => user != null;

  @action
  void setUser(LoggedUserInfo? value) => user = value;

  Future<void> signOut() async {
    final result = await _logout();
    result.fold((l) {}, (r) {
      setUser(null);
    });
  }

  Future<bool> checkLogin() async {
    final result = await _getLoggedUser();
    return result.fold<bool>((l) {
      setUser(null);
      return false;
    }, (r) {
      setUser(r);
      return true;
    });
  }
}
