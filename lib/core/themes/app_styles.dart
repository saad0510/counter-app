import 'package:flutter/rendering.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle large({
    Color color = AppColors.lightAccentColor,
  }) {
    return TextStyle(
      color: color,
      fontSize: 90,
      fontWeight: FontWeight.bold,
    );
  }
}
