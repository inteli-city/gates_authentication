import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gates_microapp_flutter/core/auth_controller.dart';
import 'package:gates_microapp_flutter/domain/enum/role_enum.dart';
import 'package:gates_microapp_flutter/generated/l10n.dart';
import 'package:gates_microapp_flutter/presenter/ui/pages/landing_page.dart';
import 'package:gates_microapp_flutter/presenter/ui/widgets/button_custom.dart';

class HomeAdminPage extends StatelessWidget {
  final Function() onPressed;
  final String email;

  const HomeAdminPage(
      {super.key, required this.onPressed, required this.email});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Modular.get();
    return LandingPage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ButtonCustom(
            onPressed: onPressed,
            text: '${S.of(context).buttonLogin} $email',
          ),
          if (authController.user!.role == RoleEnum.COLLABORATOR) ...[
            const SizedBox(height: 8),
            ButtonCustom(
              isOutlined: true,
              text: S.of(context).manageUsers,
              onPressed: () async {
                Modular.to.pushNamed('./users-management/');
              },
            ),
          ],
          const SizedBox(height: 8),
          ButtonCustom(
            isOutlined: true,
            text: S.of(context).registerUser,
            onPressed: () async {
              Modular.to.pushNamed('./create-new-user/');
            },
          ),
          const SizedBox(height: 8),
          ButtonCustom(
            isOutlined: true,
            onPressed: () async {
              await authController.signOut();
              Modular.to.navigate('/');
            },
            text: S.of(context).logout,
          ),
        ],
      ),
    );
  }
}
