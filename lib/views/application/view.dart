import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/index.dart';

import 'package:pinker/views/index.dart';

class ApplicationView extends GetView<ApplicationController> {
  const ApplicationView({super.key});

  @override
  Widget build(BuildContext context) {
    final body = Obx(() => IndexedStack(
          index: controller.state.pageIndex.value,
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
          activeIcon: const MyAssets(
            name: 'bottom_home_2',
            tyle: AssetsTyle.svg,
          ),
          icon: const MyAssets(
            name: 'bottom_home_1',
            tyle: AssetsTyle.svg,
          ),
          label: Lang.applocationViewHome.tr,
        ),
        BottomNavigationBarItem(
          activeIcon: const MyAssets(
            name: 'bottom_sear_2',
            tyle: AssetsTyle.svg,
          ),
          icon: const MyAssets(
            name: 'bottom_sear_1',
            tyle: AssetsTyle.svg,
          ),
          label: Lang.applocationViewResourceHall.tr,
        ),
        BottomNavigationBarItem(
          activeIcon: const MyAssets(
            name: 'bottom_it_2',
            tyle: AssetsTyle.svg,
          ),
          icon: const MyAssets(
            name: 'bottom_it_1',
            tyle: AssetsTyle.svg,
          ),
          label: Lang.applocationViewShortVideo.tr,
        ),
        BottomNavigationBarItem(
          activeIcon: const MyAssets(
            name: 'bottom_my_2',
            tyle: AssetsTyle.svg,
          ),
          icon: const MyAssets(
            name: 'bottom_my_1',
            tyle: AssetsTyle.svg,
          ),
          label: Lang.applocationViewMy.tr,
        ),
      ];

      return BottomNavigationBar(
        elevation: 1,
        onTap: controller.onBottomNavigation,
        items: bottomNavigationBarItems,
        type: BottomNavigationBarType.fixed,
        currentIndex: controller.state.pageIndex.value,
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
