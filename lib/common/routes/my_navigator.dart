import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../views/index.dart';
import '../index.dart';

class MyNavigator {
  MyNavigator._internal();
  static final MyNavigator _instance = MyNavigator._internal();
  static MyNavigator get to => _instance;

  /// 嵌套路由封装
  GetPageRoute _getPageRoute({
    required RouteSettings settings,
    required Widget page,
    Bindings? binding,
  }) {
    return GetPageRoute(
      settings: settings,
      page: () => page,
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
      binding: binding,
      popGesture: false,
    );
  }

  /// 嵌套路由设置
  Route? applocationRoute(RouteSettings settings) {
    Get.routing.args = settings.arguments;
    switch (settings.name) {
      case MyRoutes.home:
        return _getPageRoute(
          page: const HomeView(),
          settings: settings,
          binding: HomeBinding(),
        );
      default:
        return null;
    }
  }
}
