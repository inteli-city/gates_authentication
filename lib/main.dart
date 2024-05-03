import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gates_authentication/amplifyconfiguration.dart';
import 'package:gates_authentication/app/app_module.dart';
import 'package:gates_authentication/app/app_widget.dart';
import 'package:gates_microapp_flutter/amplify/amplify_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureAmplify(amplifyconfig);
  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
