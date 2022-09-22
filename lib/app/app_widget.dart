import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import '../config/presentation/theme/app_theme.dart';
import 'app_controller.dart';
import 'commons/helpers/localization_helper.dart';

class AppWidget extends StatefulWidget {
  AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  AppController controller = Modular.get<AppController>();

  @override
  Widget build(BuildContext context) {
    LocalizationHelper.configuration();

    final localization = <LocalizationsDelegate<dynamic>>[
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      LocalJsonLocalization.delegate
    ];

    const supportedLocales = [
      Locale('es', 'ES'),
      Locale('pt', 'BR'),
      Locale('en', 'US'),
    ];

    return MaterialApp.router(
      title: 'flutter-boilerplate',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      localizationsDelegates: localization,
      supportedLocales: supportedLocales,
      localeResolutionCallback: (locale, _) {
        return LocalizationHelper.localResolution(locale);
      },
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
