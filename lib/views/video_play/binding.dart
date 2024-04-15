import 'package:get/get.dart';

import 'index.dart';

class VideoPlayerViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoPlayerViewController>(() => VideoPlayerViewController());
  }
}
