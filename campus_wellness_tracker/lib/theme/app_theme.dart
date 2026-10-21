import 'package:flutter/material.dart';

abstract final class AppColors {
  static const ink = Color(0xFF203A35);
  static const green = Color(0xFF397B68);
  static const mint = Color(0xFFE8F3ED);
  static const cream = Color(0xFFFAF8F2);
}

abstract final class AppTheme {
  static final light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.green,
      primary: AppColors.green,
      surface: AppColors.cream,
    ),
    scaffoldBackgroundColor: AppColors.cream,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.cream,
      foregroundColor: AppColors.ink,
      centerTitle: false,
      surfaceTintColor: Colors.transparent,
    ),
    textTheme: ThemeData.light().textTheme.apply(
      bodyColor: AppColors.ink,
      displayColor: AppColors.ink,
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: const BorderSide(color: Color(0xFFE8EDE8)),
      ),
    ),
  );
}
