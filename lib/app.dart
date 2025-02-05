import 'package:bitlabs/bitlabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:survey_five/bindings/general_bindings.dart';
import 'package:survey_five/utils/constants/colors.dart';
import 'package:survey_five/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mi App de Encuestas',
      theme: MyAppTheme.myTheme,
      initialBinding: GeneralBindings(),
      home: const Scaffold(
        backgroundColor: MyColors.blueDark7,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
      // 🌍 Soporte de localización para múltiples idiomas
      localizationsDelegates: [
        ...GlobalMaterialLocalizations.delegates,
        LocalizationDelegate(), // Localización de BitLabs
      ],
      supportedLocales: const [
        Locale('en', ''), // Inglés
        Locale('es', ''), // Español
        Locale('de', ''), // Alemán
        Locale('fr', ''), // Francés
        Locale('it', ''), // Italiano
      ],
    );
  }
}
