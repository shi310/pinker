import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class ResourceHallView extends GetView<ResourceHallController> {
  const ResourceHallView({super.key});

  @override
  Widget build(BuildContext context) {
    /// appbar
    var appBar = AppBar(
      title: const Text('影片库'),
    );

    /// 页面构成
    return Scaffold(appBar: appBar);
  }
}
