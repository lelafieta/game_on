import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:game_on/src/core/strings/app_strings.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: AppColors.primary,
        fontFamily: AppStrings.fontFamily,
        cardColor: AppColors.white,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.primary,
          onPrimary: AppColors.onPrimary,
          secondary: AppColors.white,
          onSecondary: AppColors.onSecondary,
          error: AppColors.error,
          onError: AppColors.onError,
          surface: AppColors.surface,
          onSurface: AppColors.onSurface,
          background: AppColors.background,
          onBackground: AppColors.onBackground,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          toolbarHeight: 50,
          scrolledUnderElevation: 5,
          systemOverlayStyle: SystemUiOverlayStyle(),
          iconTheme: IconThemeData(
            color: AppColors.color,
          ),
          titleTextStyle: TextStyle(
            fontFamily: AppStrings.fontFamily,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.primary,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.primary,
          selectedItemColor: Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ),
        iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
          ),
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
            color: Colors.black,
            fontFamily: AppStrings.fontFamily,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            color: AppColors.primary,
            fontFamily: AppStrings.fontFamily,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
