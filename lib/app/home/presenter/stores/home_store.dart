import 'package:flutter_modular/flutter_modular.dart';
import 'package:gates_microapp_flutter/core/auth_controller.dart';
import 'package:gates_microapp_flutter/domain/entities/logged_user_info.dart';
import 'package:gates_microapp_flutter/domain/enum/role_enum.dart';
import 'package:gates_authentication/app/home/domain/entities/params.dart';
import 'package:gates_authentication/app/home/domain/usecases/get_params.dart';
import 'package:gates_authentication/app/home/domain/usecases/set_params.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';
part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final GetParams _getParams;
  final SetParams _setParams;
  final Logger logger;
  final AuthController _authController;
  HomeStoreBase(
      this._getParams, this.logger, this._authController, this._setParams) {
    if (Modular.args.uri.toString().contains('/?')) {
      final result = _setParams(Modular.args.uri);
      result.fold((l) => logger.i(l.message), (r) => null);
    }
    checkParams();
    _authController.checkLogin().then((value) {
      if (hasError) {
        Modular.to.navigate('/');
      } else {
        if (!value) {
          Modular.to.navigate('/login/');
        } else {
          _authController.user!.role == RoleEnum.USER ||
                  _authController.user!.role == RoleEnum.COLLABORATOR
              ? Modular.to.navigate('/user', arguments: [
                  () {
                    signIn();
                  },
                  _authController.user!.email
                ])
              : Modular.to.navigate('/admin/', arguments: [
                  () {
                    signIn();
                  },
                  _authController.user!.email
                ]);
        }
      }
    });
  }

  @observable
  Params? params;

  @observable
  String? error;

  @computed
  LoggedUserInfo? get user => _authController.user;

  @computed
  bool get hasError => error != null;

  void checkParams() {
    final result = _getParams();
    result.fold((l) {
      error = l.message;
      params = null;
      logger.i('Error: $error');
    }, (r) {
      params = r;
      error = null;
      logger.i('Params: ${params!.redirectUri}');
    });
  }

  void signIn() {
    var uri =
        "${params!.redirectUri}/#id_token=${_authController.user?.idToken}&access_token=${_authController.user?.accessToken}&refresh_token=${_authController.user?.refreshToken}&token_type=Bearer";
    var url = Uri.parse(uri);
    launchUrl(url, webOnlyWindowName: '_self');
  }

  Future<void> logout() async {
    await _authController.signOut();
    Modular.to.navigate('/');
  }
}
