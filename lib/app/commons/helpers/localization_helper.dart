import 'dart:async';
import 'dart:ui';

import 'package:intl/intl.dart';
import 'package:localization/localization.dart';

class LocalizationHelper {
  static Future<void> configuration() async {
    final _modules = [
      'home',
    ];

    final directories = [
      ..._modules.map((e) => 'lib/app/modules/$e/config/lang').toList(),
    ];
    LocalJsonLocalization.delegate.directories = directories;
  }

  static Locale? defaultLocale;

  static Locale localResolution(Locale? locale) {
    if (defaultLocale != null) {
      Intl.systemLocale = Intl.canonicalizedLocale(defaultLocale.toString());
      return defaultLocale!;
    }

    switch (locale?.languageCode) {
      case 'pt':
        defaultLocale = const Locale('pt', 'BR');
        break;
      case 'es':
        defaultLocale = const Locale('es', 'ES');
        break;
      case 'en':
        defaultLocale = const Locale('en', 'US');
        break;
      default:
        defaultLocale = const Locale('pt', 'BR');
    }
    Intl.systemLocale = Intl.canonicalizedLocale(defaultLocale.toString());
    return defaultLocale!;
  }

  static String maybePlural(String key, int count) {
    return count > 1 ? key + '_plural' : key;
  }
}
