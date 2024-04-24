import 'package:get/get.dart';

import 'index.dart';

class ResourceMovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResourceMovieController>(() => ResourceMovieController());
  }
}
