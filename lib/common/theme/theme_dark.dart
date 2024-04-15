part of 'my_theme.dart';

ThemeData getThemeDark() {
  return ThemeData(
    // 定义应用程序的目标平台。
    platform: TargetPlatform.iOS,

    // 是否使用 Material 3.0 样式。
    useMaterial3: true,

    // 控制主题的亮度。
    brightness: Brightness.dark,

    // 主要颜色。
    primaryColor: MyColors.primaryColor,

    // 主色-亮
    primaryColorLight: MyColors.primaryColorLight,

    // 主色-暗
    primaryColorDark: MyColors.primaryColorDark,

    // 定义应用程序的颜色方案。
    colorScheme: const ColorScheme.dark(),

    // text 主题设置
    // 包含多个不同的字体样式
    textTheme: TextTheme(
      bodySmall: TextStyle(
        color: MyColors.white.withOpacity(0.6),
        fontSize: 14,
        height: 2,
      ),
      bodyMedium: const TextStyle(
        color: MyColors.white,
        fontSize: 14,
        height: 2,
      ),
      bodyLarge: const TextStyle(
        color: MyColors.white,
        fontSize: 16,
        height: 2,
      ),
      titleSmall: const TextStyle(
        color: MyColors.primaryColor,
        fontSize: 14,
        height: 0,
      ),
      titleMedium: const TextStyle(
        color: MyColors.primaryColor,
        fontSize: 18,
        height: 0,
      ),
      titleLarge: const TextStyle(
        color: MyColors.primaryColor,
        fontSize: 30,
        height: 0,
      ),
      labelMedium: const TextStyle(
        color: MyColors.white,
        fontSize: 14,
        height: 0,
      ),
      labelSmall: TextStyle(
        color: MyColors.white.withOpacity(0.6),
        fontSize: 14,
        height: 0,
      ),
      labelLarge: const TextStyle(
        color: MyColors.white,
        fontSize: 16,
        height: 0,
      ),
      headlineSmall: const TextStyle(
        color: MyColors.white,
        fontSize: 20,
        height: 0,
      ),
      headlineMedium: const TextStyle(
        color: MyColors.white,
        fontSize: 24,
        height: 0,
      ),
      headlineLarge: const TextStyle(
        color: MyColors.white,
        fontSize: 30,
        height: 0,
      ),
    ),

    // appBar 主题
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: MyColors.white,
        fontSize: 18,
        height: 1,
      ),
    ),

    textButtonTheme: TextButtonThemeData(style: MyStyles.textButtonStyle),

    // fliiedButtonTheme 主题
    filledButtonTheme: FilledButtonThemeData(style: MyStyles.filledButtonStyle),
  );
}
