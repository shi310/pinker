import 'package:get/get.dart';

import 'index.dart';

class HomeMoviesViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeMoviesViewController>(() => HomeMoviesViewController());
  }
}
