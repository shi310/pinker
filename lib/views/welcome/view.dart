import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/index.dart';

import 'index.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final page1 = _buildPage(
      context: context,
      icon: MyIcons.init_1,
      title: Lang.welcomeViewTitle_01,
      content: Lang.welcomeViewContent_01,
    );

    final page2 = _buildPage(
      context: context,
      icon: MyIcons.init_2,
      title: Lang.welcomeViewTitle_02,
      content: Lang.welcomeViewContent_02,
    );

    final page3 = _buildPage(
      context: context,
      icon: MyIcons.init_3,
      title: Lang.welcomeViewTitle_03,
      content: Lang.welcomeViewContent_03,
      button: SizedBox(
        width: double.infinity,
        height: 40,
        child: FilledButton(
          onPressed: controller.onApplocationView,
          child: Text(
            Lang.welcomeViewButton.tr,
          ),
        ),
      ),
    );

    final tabBar = Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: SizedBox(
        width: 50,
        height: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
              List.generate(3, (index) => _buildIndicator(index, context)),
        ),
      ),
    );

    final pageView = PageView(
      controller: controller.pageController,
      onPageChanged: controller.pageChanged,
      children: [page1, page2, page3],
    );

    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            pageView,
            tabBar,
          ],
        ),
      ),
    );
  }

  // 提取创建页面的方法
  Widget _buildPage({
    required Widget icon,
    required String title,
    required String content,
    required BuildContext context,
    Widget? button,
  }) {
    return Center(
      child: SizedBox(
        width: Get.width * 0.7,
        height: Get.height,
        child: Column(
          children: [
            const SizedBox(height: 40),
            icon,
            const SizedBox(height: 40),
            Text(
              title.tr,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Text(
              content.tr,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            if (button != null) ...[
              const Spacer(),
              button,
              const SizedBox(height: 80),
            ]
          ],
        ),
      ),
    );
  }

  // 提取创建圆点指示器的方法
  Widget _buildIndicator(int index, BuildContext context) {
    return Obx(() => CircleAvatar(
          backgroundColor: controller.state.pageIndex == index
              ? Theme.of(context).primaryColor
              : Theme.of(context).colorScheme.onBackground.withOpacity(0.2),
          radius: 5,
        ));
  }
}
