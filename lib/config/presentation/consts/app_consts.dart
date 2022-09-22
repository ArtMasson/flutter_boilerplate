import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

class AppConstants {
  static const String THEME = "theme";
  final String currentOS = kIsWeb
      ? OS.web.toString()
      : Platform.isIOS
          ? OS.ios.toString()
          : OS.android.toString();
}

enum OS {
  ios,
  android,
  web,
}
