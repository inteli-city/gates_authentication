import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/generated/l10n.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/landing_page.dart';
import 'package:intelicity_auth_microapp_flutter/shared/themes/app_colors.dart';
import 'package:intelicity_auth_microapp_flutter/shared/themes/app_text_styles.dart';
import 'package:gates_authentication/app/home/presenter/stores/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get<HomeStore>();
  @override
  Widget build(BuildContext context) {
    return LandingPage(
      child: Observer(builder: (_) {
        if (store.hasError) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  S.of(context).textErrorHome,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.red)),
                  child: Text(S.of(context).textSubErrorHome('', store.error!),
                      style: const TextStyle(color: Colors.red)),
                ),
              ],
            ),
          );
        }
        return Column(
          children: [
            Text(
              'Carregando informações',
              style: AppTextStyles.headline1,
            ),
            const SizedBox(height: 8),
            CircularProgressIndicator(
              color: AppColors.primaryBlue,
            ),
          ],
        );
      }),
    );
  }
}
