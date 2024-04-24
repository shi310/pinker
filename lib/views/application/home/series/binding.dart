import 'package:get/get.dart';

import 'index.dart';

class HomeSeriesViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeSeriesViewController>(() => HomeSeriesViewController());
  }
}
