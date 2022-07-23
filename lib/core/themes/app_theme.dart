import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import 'app_styles.dart';
import 'app_colors.dart';

class AppTheme {
  const AppTheme._();
  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.lightPrimaryColor,
      secondary: AppColors.lightAccentColor,
      background: AppColors.lightBackgroundColor,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.darkAccentColor,
    ),
    textTheme: TextTheme(
      headline1: AppTextStyles.large(color: AppColors.darkAccentColor),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark().copyWith(
      primary: AppColors.darkPrimaryColor,
      secondary: AppColors.darkAccentColor,
      background: AppColors.darkBackgroundColor,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.lightAccentColor,
    ),
    textTheme: TextTheme(
      headline1: AppTextStyles.large(color: AppColors.lightAccentColor),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static Brightness get currentTheme => SchedulerBinding.instance.window.platformBrightness;

  static void setStatusBarColors(ThemeMode themeMode) {
    bool isDark = themeMode == ThemeMode.dark;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: isDark ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: isDark ? AppColors.darkBackgroundColor : AppColors.lightBackgroundColor,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        systemNavigationBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      ),
    );
  }
}
