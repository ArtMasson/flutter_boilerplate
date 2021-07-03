import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/config/ui/theme/app_theme.dart';
import 'package:flutter_boilerplate/app/config/ui/theme/domain/repositories/theme_repository.dart';
import 'package:flutter_boilerplate/common/injected/module.dart';
import 'package:mobx/mobx.dart';

part 'theme_store.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  final ThemeRepository _themeRepository = getIt.get<ThemeRepository>();

  @computed
  bool get isDark => theme.brightness == Brightness.dark;

  @observable
  ThemeData theme = ThemeData();

  @action
  Future<void> getTheme() async {
    theme = lightTheme;
    theme = await _themeRepository.getTheme();
  }

  @action
  Future<void> toggleTheme() async {
    theme = await _themeRepository.toggleTheme(theme);
  }
}
