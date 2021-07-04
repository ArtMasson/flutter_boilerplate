import 'dart:math';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class ScreenUtils {
  static double get _designHeight => 1920;

  static double get _designWidth => 1080;

  static double get width =>
      MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width;

  static double get height =>
      MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.height;

  static double get scaleFactorRealTextDevice =>
      MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
          .textScaleFactor;

  static double get scaleFactorText =>
      scaleFactorRealTextDevice <= 1.6 ? scaleFactorRealTextDevice : 1.6;

  static double get widthScale => width / _designWidth;

  static double get heightScale => height / _designHeight;

  static double get textScale => widthScale;

  static double get statusBarHeight =>
      MediaQueryData.fromWindow(WidgetsBinding.instance!.window).padding.top;

  static double get bottomBarHeight =>
      MediaQueryData.fromWindow(WidgetsBinding.instance!.window).padding.bottom;

  static double get maxLength => max(height, width);

  static double get minLength => min(height, width);

  static double staggeredHeight(double desiredHeight) =>
      desiredHeight * heightScale;

  static double staggeredWidth(double desiredWidth) =>
      desiredWidth * widthScale;

  static bool get isSmallScreen => width <= 320;
  static bool get isFlatScreen => height <= 600 || width <= 320;
  static bool get isWeb => kIsWeb;
}

extension ScreenUtilsExtension on num {
  double get h => ScreenUtils.staggeredHeight(toDouble());
  double get w => ScreenUtils.staggeredWidth(toDouble());
}
