import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart'; // Make sure to define your AppColors here

class AppTextStyles {

  const AppTextStyles._();

  static TextStyle subtitle = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle primary = GoogleFonts.poppins(
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle categoryTitle = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textGrey,
  );

  static TextStyle secondaryButtonStyle = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static TextStyle appBarTextStyles = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle displayLarge = GoogleFonts.poppins(
    fontSize: 57.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle displayMedium = GoogleFonts.poppins(
    fontSize: 45.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle displaySmall = GoogleFonts.poppins(
    fontSize: 36.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle headlineLarge = GoogleFonts.poppins(
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle headlineMedium = GoogleFonts.poppins(
    fontSize: 28.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle headlineSmall = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle titleLarge = GoogleFonts.poppins(
    fontSize: 22.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static TextStyle titleMedium = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static TextStyle titleSmall = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static TextStyle bodyLarge = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static TextStyle bodyMedium = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textGrey,
  );

  static TextStyle bodySmall = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textGrey,
  );

  static TextStyle labelLarge = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static TextStyle labelMedium = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static TextStyle labelSmall = GoogleFonts.poppins(
    fontSize: 11.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  // Custom style if needed
  static TextStyle caption = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textGrey,
  );
}
