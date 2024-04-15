import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/index.dart';

part 'theme_light.dart';
part 'theme_dark.dart';
part 'theme_extenion.dart';

class MyTheme {
  static ThemeData get light => getThemeLight();
  static ThemeData get dark => getThemeDark();
}
