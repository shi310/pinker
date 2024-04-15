import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'common/index.dart';

void main() async {
  // 初始化并加载一些全局的服务
  await Global.init();

  // 程序入口
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: MyRoutes.index, // 应用程序的初始路由路径。
      title: 'Pinker', // 应用程序的标题。
      theme: MyTheme.light, // 应用程序的默认主题。
      darkTheme: MyTheme.dark, // 应用程序的暗色主题。
      themeMode: ThemeMode.system, // 应用程序的主题模式。
      locale: Get.deviceLocale,
      fallbackLocale: MyTranslation.fallbackLocale, // 应用程序的备用语言区域。
      localizationsDelegates: MyTranslation.localizationsDelegates, // 本地化委托列表。
      supportedLocales: MyTranslation.supportedLocales, // 应用程序支持的语言区域列表。
      debugShowCheckedModeBanner: false, // 是否显示检查模式横幅。
      translations: MyTranslation(), // 翻译对象。
      defaultTransition: Transition.rightToLeftWithFade, // 默认过渡动画。
      getPages: MyPages.getPages, // 页面列表。
      popGesture: true, // 是否启用滑动返回手势。
      transitionDuration: const Duration(milliseconds: 300), // 过渡动画的持续时间。
      unknownRoute: MyPages.unknownRoute, // 未知路由。
    );
  }
}
