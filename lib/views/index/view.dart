import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/index.dart';
import '../index.dart';

class IndexView extends GetView<IndexController> {
  const IndexView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      extendBodyBehindAppBar: true,
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      actions: [
        _buildSkipAdButton(context),
        const SizedBox(width: 16), // Maintain consistent padding
      ],
      backgroundColor: Colors.transparent, // Ensure AppBar is transparent
      elevation: 0, // Remove shadow
    );
  }

  Widget _buildSkipAdButton(BuildContext context) {
    return MyButton(
        height: 32,
        color: Theme.of(context).primaryColor.withOpacity(0.2),
        onTap: controller.onApplicationView,
        child: Obx(
          () => Text(
            '${Lang.indexViewSkipAdsAfter.tr} ${controller.advertiseTime - controller.state.timer} ${Lang.indexeViewSeconds.tr}',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ));
  }

  Widget _buildBody(BuildContext context) {
    return const MyAssets(
      name: 'ads_01',
      tyle: AssetsTyle.jpg,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
