import 'package:flutter/material.dart';
import 'package:github_search/config/app_color.dart';

abstract class AppTextStyles {
  static const fontFamilyDefault = 'Roboto';

  AppTextStyles._();

  static TextStyle caption1({Color color = AppColors.black, double height = 20 / 12}) {
    return TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      height: height,
      color: color,
      fontFamily: fontFamilyDefault,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle caption2({FontWeight fontWeight = FontWeight.w400, color = AppColors.black, double height = 20 / 12}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: fontWeight,
      height: height,
      color: color,
      fontFamily: fontFamilyDefault,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle caption3({Color color = AppColors.black, double height = 20 / 12}) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      height: height,
      color: color,
      fontFamily: fontFamilyDefault,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle caption4({FontWeight fontWeight = FontWeight.w500, color = AppColors.black, double height = 20 / 12}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: fontWeight,
      height: height,
      color: color,
      fontFamily: fontFamilyDefault,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle button1({Color color = AppColors.black, double height = 20 / 15}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: height,
      color: color,
      letterSpacing: 0.3,
      fontFamily: fontFamilyDefault,
      decoration: TextDecoration.none,
    );
  }
}
