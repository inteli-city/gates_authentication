import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gates_microapp_flutter/generated/l10n.dart';
import 'package:gates_microapp_flutter/shared/helpers/utils/validation_field.dart';
import 'package:gates_microapp_flutter/presenter/controllers/confirm_reset_password_controller.dart';
import 'package:gates_microapp_flutter/presenter/states/basic_state.dart';
import 'package:gates_microapp_flutter/presenter/ui/pages/landing_page.dart';
import 'package:gates_microapp_flutter/presenter/ui/widgets/button_custom.dart';
import 'package:gates_microapp_flutter/presenter/ui/widgets/text_field_custom.dart';
import 'package:gates_microapp_flutter/shared/themes/app_text_styles.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              width: 600,
              child: AlertDialog(
                title: Text(S.of(context).attention),
                content: Text(
                  S.of(context).codeDisclaimer,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final ConfirmResetPasswordController controller = Modular.get();
    final formKey = GlobalKey<FormState>();
    return LandingPage(
      child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                S.of(context).verifyEmail,
                style: AppTextStyles.headline1,
              ),
              const SizedBox(height: 8),
              Text(
                S.of(context).newPasswordPageText,
                style: AppTextStyles.bodyText1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Observer(builder: (_) {
                return TextFielCustom(
                  hintText: S.of(context).code,
                  onChanged: controller.setCode,
                  prefixIcon: Icons.vpn_key,
                  validation: ValidationFieldHelper.validateRequiredField,
                );
              }),
              const SizedBox(height: 8),
              Text(
                S.of(context).passwordRequirements,
                style: AppTextStyles.bodyText1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Observer(builder: (_) {
                return TextFielCustom(
                  hintText: S.of(context).newPassword,
                  onChanged: controller.setNewPassword,
                  prefixIcon: Icons.lock,
                  validation: ValidationFieldHelper.validatePassword,
                  isPasswordField: true,
                  changePwdVisibility: controller.changePasswordVisibility,
                  showPassword: controller.passwordVisible,
                );
              }),
              const SizedBox(height: 16),
              Observer(builder: (_) {
                return TextFielCustom(
                  hintText: S.of(context).confirmNewPassword,
                  onChanged: controller.setConfirmPassword,
                  prefixIcon: Icons.lock,
                  validation: controller.validateConfirmPassword,
                  isPasswordField: true,
                  changePwdVisibility:
                      controller.changeConfirmPasswordVisibility,
                  showPassword: controller.confirmPasswordVisible,
                );
              }),
              const SizedBox(height: 16),
              Observer(builder: (_) {
                return ButtonCustom(
                  text: S.of(context).send,
                  isLoading: controller.state is BasicLoadingState,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await controller.confirmNewPassword();
                    }
                  },
                );
              }),
            ],
          )),
    );
  }
}
