import 'package:flutter_modular/flutter_modular.dart';
import 'package:gates_microapp_flutter/domain/usecases/confirm_reset_password.dart';
import 'package:gates_microapp_flutter/shared/helpers/functions/global_snackbar.dart';
import 'package:gates_microapp_flutter/shared/helpers/utils/validation_field.dart';
import 'package:gates_microapp_flutter/presenter/states/basic_state.dart';
import 'package:mobx/mobx.dart';
part 'confirm_reset_password_controller.g.dart';

class ConfirmResetPasswordController = ConfirmResetPasswordControllerBase
    with _$ConfirmResetPasswordController;

abstract class ConfirmResetPasswordControllerBase with Store {
  final IConfirmResetPasswordUsecase _confirmResetPassword;
  late final String _email;

  ConfirmResetPasswordControllerBase(this._confirmResetPassword) {
    _email = Modular.args.data;
  }

  @observable
  BasicState state = BasicInitialState();

  @action
  void setState(BasicState value) => state = value;

  @observable
  bool passwordVisible = false;

  @action
  void changePasswordVisibility() => passwordVisible = !passwordVisible;

  @observable
  bool confirmPasswordVisible = false;

  @action
  void changeConfirmPasswordVisibility() =>
      confirmPasswordVisible = !confirmPasswordVisible;

  @action
  String? validateConfirmPassword(String? value) {
    return ValidationFieldHelper.validateConfirmPassword(
        newPassword, confirmPassword);
  }

  @observable
  String code = '';

  @action
  void setCode(String value) => code = value;

  @observable
  String newPassword = '';

  @action
  void setNewPassword(String value) => newPassword = value;

  @observable
  String confirmPassword = '';

  @action
  void setConfirmPassword(String value) => confirmPassword = value;

  Future<void> confirmNewPassword() async {
    setState(BasicLoadingState());
    var result = await _confirmResetPassword(_email, code, newPassword);
    setState(result.fold((e) {
      GlobalSnackBar.error(e.errorMessage);
      return BasicErrorState(error: e);
    }, (user) {
      Modular.to.navigate('/');
      return BasicInitialState();
    }));
  }
}
