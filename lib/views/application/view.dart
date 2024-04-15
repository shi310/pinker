import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/index.dart';
import 'package:pinker/views/application/resource_hall/view.dart';
import 'package:pinker/views/application/short_video/index.dart';

import 'package:pinker/views/index.dart';

class ApplicationView extends GetView<ApplicationController> {
  const ApplicationView({super.key});

  @override
  Widget build(BuildContext context) {
    final body = Obx(() => IndexedStack(
          index: controller.state.index,
          children: const [
            HomeView(),
            ResourceHallView(),
            ShortVideoView(),
            MyView(),
          ],
        ));

    Widget buildBottomNavigationBar() {
      var bottomNavigationBarItems = [
        BottomNavigationBarItem(
          activeIcon: MyIcons.bottomHome_2,
          icon: MyIcons.bottomHome_1,
          label: Lang.applocationViewHome.tr,
        ),
        BottomNavigationBarItem(
          activeIcon: MyIcons.bottomSear_2,
          icon: MyIcons.bottomSear_1,
          label: Lang.applocationViewResourceHall.tr,
        ),
        BottomNavigationBarItem(
          activeIcon: MyIcons.bottomIt_2,
          icon: MyIcons.bottomIt_1,
          label: Lang.applocationViewShortVideo.tr,
        ),
        BottomNavigationBarItem(
          activeIcon: MyIcons.bottomMy_2,
          icon: MyIcons.bottomMy_1,
          label: Lang.applocationViewMy.tr,
        ),
      ];

      return BottomNavigationBar(
        elevation: 1,
        onTap: controller.onBottomNavigation,
        items: bottomNavigationBarItems,
        type: BottomNavigationBarType.fixed,
        currentIndex: controller.state.index,
        backgroundColor: Theme.of(context).colorScheme.background,
        selectedFontSize: 12,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).applicationUnselectedItemColor,
      );
    }

    return Scaffold(
      body: body,
      bottomNavigationBar: Obx(buildBottomNavigationBar),
    );
  }
}
