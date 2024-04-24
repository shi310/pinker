import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/index.dart';

import 'index.dart';

class MyView extends GetView<MyController> {
  const MyView({super.key});

  @override
  Widget build(BuildContext context) {
    /// appbar
    var appBar = AppBar(
      title: const Text('我的页面'),
    );

    /// 页面构成
    return Scaffold(
      appBar: appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity, height: 40),
          MyButton(
            color: Theme.of(context).primaryColor,
            width: Get.width * 0.6,
            height: 40,
            child: const Text('俄罗斯方块'),
            onTap: () => Get.toNamed(MyRoutes.tetris),
          ),
        ],
      ),
    );
  }
}
