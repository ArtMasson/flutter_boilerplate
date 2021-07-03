import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/config/ui/consts/app_consts.dart';
import 'package:flutter_boilerplate/app/config/ui/theme/app_theme.dart';
import 'package:flutter_boilerplate/app/config/ui/theme/domain/repositories/theme_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepositoryImp implements ThemeRepository {
  @override
  Future<void> setThemeKey(Brightness brightness) async {
    (await SharedPreferences.getInstance()).setString(
      AppConstants.THEME,
      brightness == Brightness.light ? "light" : "dark",
    );
  }

  @override
  Future<String?> getThemeKey() async {
    return (await SharedPreferences.getInstance())
        .getString(AppConstants.THEME);
  }

  @override
  Future<ThemeData> getTheme() async {
    final String? themeKey = await getThemeKey();

    if (themeKey == null) {
      await setThemeKey(lightTheme.brightness);

      return lightTheme;
    } else {
      return themeKey == "light" ? lightTheme : darkTheme;
    }
  }

  @override
  Future<ThemeData> toggleTheme(ThemeData theme) async {
    if (theme == lightTheme) {
      theme = darkTheme;
    } else {
      theme = lightTheme;
    }

    await setThemeKey(theme.brightness);
    return theme;
  }
}
