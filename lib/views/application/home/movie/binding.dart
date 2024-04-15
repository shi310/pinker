import 'package:get/get.dart';

import 'index.dart';

class MovieViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieViewController>(() => MovieViewController());
  }
}
