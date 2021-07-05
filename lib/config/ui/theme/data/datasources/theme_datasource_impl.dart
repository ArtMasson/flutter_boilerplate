import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/config/ui/consts/app_consts.dart';
import 'package:flutter_boilerplate/config/ui/theme/app_theme.dart';
import 'package:flutter_boilerplate/config/ui/theme/data/datasources/theme_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeDataSourceImpl implements ThemeDataSource {
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
