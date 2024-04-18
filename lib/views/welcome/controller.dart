import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/views/index.dart';

import '../../common/index.dart';

class WelcomeController extends GetxController {
  final pageController = PageController();
  final state = WelcomeState();

  @override
  void onReady() {
    super.onReady();

    // 如果是第一次安装 APP，到达 welcome 页面后，会把isUsedApp赋值为 true
    // 表示已经使用过 APP，下次就不会再进入 welcome 页面
    // 并保存到本地
    ConfigController.to.isUsedApp = true;
    SharedService.to.setBool(sharedIsUsedAppKey, true);
  }

  void pageChanged(index) => state.pageIndex = index;

  void onApplocationView() => Get.offAllNamed(MyRoutes.application);
}
