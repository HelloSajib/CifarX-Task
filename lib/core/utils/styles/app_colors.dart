import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // Prevent instantiation

  // Brand Colors
  static const Color primaryColor = Color(0xFF1D65FF);
  static const Color grey = Color(0xFF999999);
  static const Color greyLight = Color(0xFFEEEEEE);
  static const Color goldColor = Color(0xFFF3603F);
  static const Color greenColor = Color(0xFF53B175);
  static const Color deepBlue = Color(0xFF2A37C2);
  static const Color blueLight = Color(0xFF0E64D2); // Alias for deepBlue
  static const Color deepOrange = Color(0xFFFF7648);
  static const Color lightOrange = Color(0xFFFFC278);
  static const Color deepPurpleAccent = Color(0xFF7364E6);
  static const Color deepGreen = Color(0xFF0D6E58);
  static const Color deepPink = Color(0xFFAC136F);
  static const Color deepRed = Color(0xFFC22A2C);
  static const Color tealBlue = Color(0xFF138BAC);


  // UI Support Colors
  static const Color textPrimary = Color(0xFF181725);
  static const Color textGrey = Color(0xFF636363);

  static const Color textGreyLight = Color(0xFF9B9B9B);
  static const Color borderColor = Color(0xFF9B9B9B);

  // Status Colors
  static const Color errorRed = Color(0xFFFB1518);

  // Background
  static const Color background = Color(0xFFFFFFFF);



  /// Splash Colors
  static Color randomColors(){
    const List<Color> colors = [
      blueLight,
      deepOrange,
      deepPurpleAccent,
      deepGreen,
      deepPink,
      deepRed,
      tealBlue
    ];
    return colors[Random().nextInt(colors.length)];
  }

}
