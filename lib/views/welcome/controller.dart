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

    ConfigController.to.isUsedApp = true;
    SharedService.to.setBool(sharedIsUsedAppKey, true);
  }

  void pageChanged(index) => state.pageIndex = index;

  void onApplocationView() => Get.offAllNamed(MyRoutes.application);
}
