import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class ShortVideoView extends GetView<ShortVideoController> {
  const ShortVideoView({super.key});

  @override
  Widget build(BuildContext context) {
    /// appbar
    var appBar = AppBar(
      title: const Text('短视频'),
    );

    /// 页面构成
    return Scaffold(appBar: appBar);
  }
}
