import 'package:flutter/material.dart';

abstract class ThemeDataSource {
  Future<String?> getThemeKey();
  Future<void> setThemeKey(Brightness brightness);
  Future<ThemeData> getTheme();
  Future<ThemeData> toggleTheme(ThemeData theme);
}
