import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/index.dart';
import 'package:pinker/views/application/resource_hall/index.dart';
import 'package:pinker/views/index.dart';

class ResourceHallView extends StatelessWidget {
  const ResourceHallView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResourceHallController>(
      init: ResourceHallController(),
      builder: (controller) {
        /// 页面构成
        return Scaffold(
          appBar: _buildAppBar(context, controller),
          body: _buildBody(context, controller),
          backgroundColor: Theme.of(context).colorScheme.background,
        );
      },
    );
  }

  AppBar _buildAppBar(BuildContext context, ResourceHallController controller) {
    return AppBar(
      shadowColor: Theme.of(context).colorScheme.onBackground.withOpacity(0.3),
      elevation: 1,
      titleSpacing: 0,
      title: MyTabBar(
        textStyle: Theme.of(context).textTheme.labelLarge,
        seclectTextStyle: Theme.of(context).textTheme.titleMedium,
        tabs: controller.types,
        onTap: (context, index) {},
      ),
    );
  }

  Widget _buildBody(BuildContext context, ResourceHallController controller) {
    return Obx(() => IndexedStack(
          index: controller.state.index,
          children: const [
            ResourceMovieView(),
            // 替换成您实际的页面视图
            Text("Page 2"),
            Text("Page 3"),
            Text("Page 4"),
            Text("Page 5"),
          ],
        ));
  }
}
