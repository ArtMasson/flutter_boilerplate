import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppFonts {
  static const String family = 'Poppins';

  static const double textSmallerSize = 12.0;
  static const double textSmallSize = 14.0;
  static const double textSize = 16.0;
  static const double textBigSize = 18.0;
  static const double textBiggerSize = 20.0;
  static const double textBiggestSize = 24.0;
  static const double inputTextSize = textSmallSize;
  static const double buttonFontSize = textSize;

  static const FontWeight medium = FontWeight.w500;
  static const FontWeight normal = FontWeight.w400;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight full = FontWeight.w900;

  static TextStyle getTextStyle({
    double fontSize = textSize,
    FontWeight fontWeight = normal,
    Color fontColor = Colors.black,
    double colorOpacity = 1,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: AppFonts.family,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: fontColor.withOpacity(colorOpacity),
        decoration: decoration,
      );
}
