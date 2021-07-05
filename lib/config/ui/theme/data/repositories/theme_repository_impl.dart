import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/config/ui/theme/data/datasources/theme_datasource.dart';
import 'package:flutter_boilerplate/config/ui/theme/domain/repositories/theme_repository.dart';
import 'package:flutter_boilerplate/core/common/injected/module.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeDataSource _datasource = getIt.get<ThemeDataSource>();

  @override
  Future<void> setThemeKey(Brightness brightness) =>
      _datasource.setThemeKey(brightness);

  @override
  Future<String?> getThemeKey() => _datasource.getThemeKey();

  @override
  Future<ThemeData> getTheme() => _datasource.getTheme();

  @override
  Future<ThemeData> toggleTheme(ThemeData theme) =>
      _datasource.toggleTheme(theme);
}
