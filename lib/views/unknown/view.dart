import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/index.dart';

import 'index.dart';

class UnknownView extends GetView<UnknownController> {
  const UnknownView({super.key});

  @override
  Widget build(BuildContext context) {
    /// appbar
    var appBar = AppBar(
      title: Text(Lang.unknownViewTltle.tr),
    );

    /// 页面构成
    return Scaffold(appBar: appBar);
  }
}
