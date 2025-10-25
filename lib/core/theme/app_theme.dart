import 'package:cifarx_task/core/utils/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._(); // Private constructor to prevent instantiation

  /// **Light Theme**
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.blueLight,
    scaffoldBackgroundColor: AppColors.background,
    // colorScheme: const ColorScheme.light(
    //   primary: AppColors.primary,
    //   primaryContainer: AppColors.primaryVariant,
    //   secondary: AppColors.secondary,
    //   secondaryContainer: AppColors.secondaryVariant,
    //   background: AppColors.background,
    //   surface: AppColors.surface,
    //   error: AppColors.error,
    //   onPrimary: AppColors.onPrimary,
    //   onSecondary: AppColors.onSecondary,
    //   onBackground: AppColors.onBackground,
    //   onSurface: AppColors.onSurface,
    //   onError: AppColors.onError,
    // ),
    // textTheme: const TextTheme(
    //   headline1: AppTextStyles.headline1,
    //   headline2: AppTextStyles.headline2,
    //   bodyText1: AppTextStyles.bodyText1,
    //   bodyText2: AppTextStyles.bodyText2,
    //   button: AppTextStyles.button,
    //   caption: AppTextStyles.caption,
    // ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blueLight,
        //foregroundColor: AppColors.onPrimary,
        //textStyle: AppTextStyles.button,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );

}
