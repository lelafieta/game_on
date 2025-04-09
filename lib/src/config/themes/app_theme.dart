import 'package:flutter/material.dart';
import 'package:game_on/src/core/strings/app_strings.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: AppColors.primary,
        fontFamily: AppStrings.fontFamily,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.primary,
          onPrimary: AppColors.onPrimary,
          secondary: AppColors.secondary,
          onSecondary: AppColors.onSecondary,
          error: AppColors.error,
          onError: AppColors.onError,
          surface: AppColors.surface,
          onSurface: AppColors.onSurface,
          background: AppColors.background,
          onBackground: AppColors.onBackground,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontFamily: AppStrings.fontFamily,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.primary,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.primary,
          selectedItemColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Color(0xFF777777),
            fontFamily: AppStrings.fontFamily,
          ),
          bodyMedium: TextStyle(
            color: Color(0xFF777777),
            fontFamily: AppStrings.fontFamily,
          ),
          bodySmall: TextStyle(
            color: Color(0xFF777777),
            fontFamily: AppStrings.fontFamily,
          ),
          headlineMedium: TextStyle(
            color: Color(0xFF777777),
            fontFamily: AppStrings.fontFamily,
          ),
          headlineSmall: TextStyle(
            color: Color(0xFF777777),
            fontFamily: AppStrings.fontFamily,
          ),
          titleMedium: TextStyle(
            color: Color(0xFF777777),
            fontFamily: AppStrings.fontFamily,
          ),
        ),
      );
}
