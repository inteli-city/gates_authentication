import 'package:flutter_modular/flutter_modular.dart';
import 'package:gates_microapp_flutter/domain/usecases/reset_password_usecase.dart';
import 'package:gates_microapp_flutter/helpers/functions/global_snackbar.dart';
import 'package:gates_microapp_flutter/presenter/states/basic_state.dart';
import 'package:mobx/mobx.dart';

part 'forgot_password_controller.g.dart';

class ForgotPasswordController = ForgotPasswordControllerBase
    with _$ForgotPasswordController;

abstract class ForgotPasswordControllerBase with Store {
  final IResetPasswordUsecase _resetPassword;

  ForgotPasswordControllerBase(this._resetPassword);

  @observable
  BasicState state = BasicInitialState();

  @action
  void setState(BasicState value) => state = value;

  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  Future<void> resetPassword() async {
    setState(BasicLoadingState());
    var result = await _resetPassword(email: email);
    setState(result.fold((e) {
      GlobalSnackBar.error(e.errorMessage);
      return BasicErrorState(error: e);
    }, (user) {
      Modular.to.pushNamed('/login/new-password', arguments: email);
      return BasicInitialState();
    }));
  }
}
