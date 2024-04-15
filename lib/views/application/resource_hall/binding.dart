import 'package:get/get.dart';

import 'index.dart';

class ResourceHallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResourceHallController>(() => ResourceHallController());
  }
}
