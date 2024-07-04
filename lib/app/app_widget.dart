import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gates_microapp_flutter/generated/l10n.dart';
import 'package:gates_microapp_flutter/shared/helpers/functions/global_snackbar.dart';
import 'package:gates_microapp_flutter/shared/themes/app_colors.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/');
    return MaterialApp.router(
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      title: 'Gates - Autenticação Unificada',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: AppColors.primaryBlue.withOpacity(0.4),
          cursorColor: AppColors.primaryBlue.withOpacity(0.4),
          selectionHandleColor: AppColors.primaryBlue.withOpacity(0.4),
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: AppColors.primaryBlue,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.white,
          ),
        ),
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
