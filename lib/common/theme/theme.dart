import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'theme_light.dart';
part 'theme_dark.dart';

class MyTheme {
  static const horizontalMargin = 16.0;
  static const radius = 10.0;
  static const borderRadius = BorderRadius.all(Radius.circular(8));
  static const decoration = BoxDecoration(shape: BoxShape.rectangle);
  static ThemeData light = themeLight;
  static ThemeData dark = themeDark;
}
