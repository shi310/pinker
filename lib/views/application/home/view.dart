import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/views/index.dart';
import '../../../common/index.dart';
import 'index.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          appBar: _buildAppBar(context, controller),
          body: _buildBody(context, controller),
          extendBodyBehindAppBar: true,
          extendBody: true,
          backgroundColor: Theme.of(context).colorScheme.background,
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    HomeController controller,
  ) {
    final searchText = Obx(() => Text(
          controller.state.searchWord,
          style: Theme.of(context).textTheme.labelSmall,
        ));

    final searchBox = MyButton(
      onTap: controller.onSearchView,
      height: 32,
      color: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          const SizedBox(width: 20),
          searchText,
          const Spacer(),
          Row(
            children: [
              Container(
                width: 1,
                height: 24,
                color: Theme.of(context).applicationSearchButtonLine1,
              ),
              Container(
                width: 1,
                height: 24,
                color: Theme.of(context).applicationsearchButtonLine2,
              ),
              const SizedBox(width: 20),
              const Center(
                child: MyAssets(
                  name: 'search',
                  tyle: AssetsTyle.svg,
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
        ],
      ),
    );

    final appBarChild = Row(
      children: [
        const MyAssets(
          name: 'logo',
          tyle: AssetsTyle.svg,
        ),
        const SizedBox(width: 16),
        Expanded(child: searchBox),
      ],
    );

    final tabBar = MyTabBar(
      tabs: controller.types,
      onTap: controller.onTabBar,
    );

    return PreferredSize(
      preferredSize: Size.fromHeight(
        MediaQuery.of(context).padding.top + kToolbarHeight - 20 + 10,
      ),
      child: Stack(
        children: [
          _buildAppBarBackground(context, controller),
          AppBar(
            backgroundColor: Colors.transparent,
            title: appBarChild,
            elevation: 2,
            // surfaceTintColor: Colors.transparent,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: tabBar,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBarBackground(
      BuildContext context, HomeController controller) {
    return ClipRect(
      child: Obx(() {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: controller.state.offset.clamp(0, 16 * 50) / 50,
            sigmaY: controller.state.offset.clamp(0, 16 * 50) / 50,
          ),
          child: Opacity(
            opacity: Get.isDarkMode
                ? controller.state.offset.clamp(0, 0.6 * 200) / 200
                : 0.85,
            child: Container(
              color: Theme.of(context).colorScheme.background,
            ),
          ),
        );
      }),
    );
  }

  Widget _buildBody(BuildContext context, HomeController controller) {
    return Obx(
      () => IndexedStack(
        index: controller.state.pageIindex.value,
        children: const [
          HomeMoviesViewView(),
          HomeSeriesViewView(),
          Text("Page 3"),
          Text("Page 4"),
          Text("Page 5"),
        ],
      ),
    );
  }
}
