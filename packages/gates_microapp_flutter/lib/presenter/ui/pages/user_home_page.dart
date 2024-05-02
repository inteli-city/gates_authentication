import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gates_microapp_flutter/core/auth_controller.dart';
import 'package:gates_microapp_flutter/generated/l10n.dart';
import 'package:gates_microapp_flutter/presenter/ui/pages/landing_page.dart';
import 'package:gates_microapp_flutter/presenter/ui/widgets/button_custom.dart';

class UserHomePage extends StatelessWidget {
  final Function() onPressed;
  final String email;

  const UserHomePage({super.key, required this.onPressed, required this.email});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Modular.get();
    return LandingPage(
      child: Column(
        children: [
          ButtonCustom(
            onPressed: onPressed,
            text: '${S.of(context).buttonLogin} $email',
          ),
          const SizedBox(height: 8),
          ButtonCustom(
            isOutlined: true,
            onPressed: () async {
              await authController.signOut();
              Modular.to.navigate('/');
            },
            text: S.of(context).logout,
          )
        ],
      ),
    );
  }
}
