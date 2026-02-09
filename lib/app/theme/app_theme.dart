import 'package:cryptoapp/app/const/app_color.dart';

import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.primaryText, size: 28),
      titleTextStyle: TextStyle(color: AppColors.primaryText, fontSize: 16, fontWeight: FontWeight.w700),
    ),

    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.bull,
      error: AppColors.bear,
      surface: AppColors.input,
    ),
  );
}
