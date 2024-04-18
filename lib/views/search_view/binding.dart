import 'package:get/get.dart';

import 'index.dart';

class SearchViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchViewViewController>(() => SearchViewViewController());
  }
}
