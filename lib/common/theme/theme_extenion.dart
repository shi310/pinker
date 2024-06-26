part of 'my_theme.dart';

/// 自定义主题颜色
extension ThemeExtenion on ThemeData {
  // ---------------------------------- Public ----------------------------------
  /// ## 获取颜色
  /// - 可以设置单色，不会随主题变动
  /// - 可以设置双色， 随主题改变而改变哦
  Color getColor({
    Color? primaryColor,
    Color? secondColor,
  }) {
    return primaryColor != null && secondColor != null
        ? (Get.isDarkMode ? secondColor : primaryColor)
        : primaryColor ?? (Get.isDarkMode ? MyColors.black : MyColors.white);
  }

  /// ## 获取字体样式
  /// 可以设置字号，高度
  /// - 可以设置单色，不会随主题变动
  /// - 可以设置双色， 随主题改变而改变哦
  TextStyle getTextStyle(
      {double? fontSize,
      double? height,
      Color? color,
      Color? secondColor,
      List<Shadow>? shadows}) {
    return TextStyle(
      shadows: shadows,
      fontSize: fontSize,
      color: color != null && secondColor != null
          ? (Get.isDarkMode ? secondColor : primaryColor)
          : color ?? (Get.isDarkMode ? MyColors.white : MyColors.black),
      height: height,
    );
  }

  // 按钮上的文字颜色
  TextStyle get myTextButtonStyle =>
      Get.isDarkMode ? MyStyles.textStyleLight : MyStyles.textStyleDark;

  // 选中的按钮文字颜色，一般用在 TabBar 上
  TextStyle get mySelectTextButtonStyle => MyStyles.textStylePrimary;

  // 固定的白色文字样式
  TextStyle get myTextStyleLight => MyStyles.textStyleLight;

  // 固定的白色文字样式
  TextStyle get myTextStyleDark => MyStyles.textStyleDark;

  // ---------------------------------- Index 页面专用 ----------------------------------
  Color get indexSkipButtonColor => MyColors.geryTranslucent;
  TextStyle get indexOnSkipButtonTextStyle => MyStyles.textStyleLight;

  // ---------------------------------- Application ----------------------------------
  Color get applicationUnselectedItemColor => Get.isDarkMode
      ? MyColors.white.withOpacity(0.4)
      : MyColors.black.withOpacity(0.4);

  Color get applicationSearchButtonLine1 => Get.isDarkMode
      ? MyColors.black.withOpacity(0.4)
      : MyColors.black.withOpacity(0.15);

  Color get applicationsearchButtonLine2 => Get.isDarkMode
      ? MyColors.white.withOpacity(0.2)
      : MyColors.white.withOpacity(0.5);

  // ---------------------------------- 俄罗斯方块的默认主色 ----------------------------------
  Color get tetrisDefaultPrimaryColor =>
      Get.isDarkMode ? const Color(0xFF303032) : const Color(0xFFCACACA);

  // 俄罗斯方块的默认辅色
  Color get tetrisDefaultSecondColor =>
      Get.isDarkMode ? const Color(0x30303032) : const Color(0x30CACACA);

  // 俄罗斯方块的移动和着陆主色
  Color get tetrisMovePrimaryColor =>
      Get.isDarkMode ? const Color(0xFF13C77F) : const Color(0xFFB52727);

  // 俄罗斯方块的移动和着陆辅色
  Color get tetrisMoveSecondColor =>
      Get.isDarkMode ? const Color(0x2013C77F) : const Color(0x20B52727);

  // 边框的颜色
  Color get tetrisOutline =>
      Get.isDarkMode ? const Color(0xFF747474) : const Color(0xff000000);

  // 半透明背景色
  Color get halfBlackground =>
      Get.isDarkMode ? const Color(0x50000000) : const Color(0x50ffffff);
}
