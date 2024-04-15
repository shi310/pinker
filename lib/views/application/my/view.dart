import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Scaffold(appBar: appBar);
  }
}
