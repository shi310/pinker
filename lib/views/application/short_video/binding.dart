import 'package:get/get.dart';

import 'index.dart';

class ShortVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShortVideoController>(() => ShortVideoController());
  }
}
