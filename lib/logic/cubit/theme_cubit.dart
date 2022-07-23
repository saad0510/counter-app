import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../core/themes/app_theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(ThemeMode.light)) {
    updateTheme();
  }

  void updateTheme() {
    final brightness = AppTheme.currentTheme;
    brightness == Brightness.dark ? _setTheme(ThemeMode.dark) : _setTheme(ThemeMode.light);
  }

  void _setTheme(ThemeMode themeMode) {
    AppTheme.setStatusBarColors(themeMode);
    emit(ThemeState(themeMode));
  }
}
