import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'common/index.dart';

void main() async {
  // 初始化
  // 加载一些全局的服务
  await Global.init();

  // 程序入口
  // 这里是程序的开始
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // key：用于标识GetMaterialApp的唯一键。
      // navigatorKey：用于管理应用程序导航器的全局键。
      // scaffoldMessengerKey：用于管理应用程序scaffoldMessenger的全局键。
      // home: const HomeView(), // 应用程序的初始页面。
      // routes: {}, // 应用程序的路由映射表，用于定义不同路径对应的页面。
      initialRoute: MyRoutes.index, // 应用程序的初始路由路径。
      // onGenerateRoute：用于生成命名路由的回调函数。
      // onGenerateInitialRoutes：用于生成初始路由列表的回调函数。
      // onUnknownRoute：在找不到路由时的回调函数。
      // useInheritedMediaQuery：是否使用继承的媒体查询。
      // navigatorObservers：导航器观察器列表。
      // builder：应用程序的构建器函数。
      // textDirection：应用程序的文本方向。
      title: 'Pinker', // 应用程序的标题。
      // onGenerateTitle：用于生成应用程序标题的回调函数。
      // color：应用程序的颜色。
      theme: MyTheme.light, // 应用程序的默认主题。
      darkTheme: MyTheme.dark, // 应用程序的暗色主题。
      themeMode: ThemeMode.system, // 应用程序的主题模式。
      locale: Translation.locale, // 应用程序的语言区域。
      fallbackLocale: Translation.fallbackLocale, // 应用程序的备用语言区域。
      localizationsDelegates: const [
        // RefreshLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ], //本地化委托列表。
      // localeListResolutionCallback：用于解析语言区域列表的回调函数。
      // localeResolutionCallback：用于解析语言区域的回调函数。
      supportedLocales: const [
        Locale('zh', 'CN'), // 中文简体
        Locale('en', 'US'), // 美国英语
      ], // 应用程序支持的语言区域列表。
      // debugShowMaterialGrid：是否显示材质网格。
      // showPerformanceOverlay：是否显示性能叠加层。
      // checkerboardRasterCacheImages：是否显示栅格缓存图像的棋盘格。
      // checkerboardOffscreenLayers：是否显示屏幕外层的棋盘格。
      // showSemanticsDebugger：是否显示语义调试器。
      debugShowCheckedModeBanner: false, // 是否显示检查模式横幅。
      // shortcuts：快捷键映射表。
      // scrollBehavior：滚动行为。
      // customTransition：自定义过渡动画。
      // translationsKeys：翻译键映射表。
      translations: Translation(), // 翻译对象。
      // onInit：初始化回调函数。
      // onReady：就绪回调函数。
      // onDispose：销毁回调函数。
      // routingCallback：路由回调函数。
      defaultTransition: Transition.rightToLeftWithFade, // 默认过渡动画。
      getPages: AppPages.getPages, // 页面列表。
      // opaqueRoute：是否使用不透明路由。
      // enableLog：是否启用日志记录。
      // logWriterCallback：日志写入回调函数。
      popGesture: true, // 是否启用滑动返回手势。
      transitionDuration: const Duration(milliseconds: 300), // 过渡动画的持续时间。
      // defaultGlobalState：是否使用默认的全局状态。
      // smartManagement：状态管理的智能管理模式。
      // initialBinding：初始绑定。
      unknownRoute: AppPages.unknownRoute, // 未知路由。
      // highContrastTheme：高对比度主题。
      // highContrastDarkTheme：高对比度暗色主题。
      // actions：动作映射表。
    );
  }
}
