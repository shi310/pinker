import 'package:get/get.dart';

import 'index.dart';

class GameTertisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameTertisController>(() => GameTertisController());
  }
}
