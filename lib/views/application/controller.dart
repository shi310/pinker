import 'package:get/get.dart';

import 'index.dart';

class ApplicationController extends GetxController {
  final state = ApplicationState();

  void onBottomNavigation(int index) {
    if (state.index == index) return;
    state.index = index;
  }
}
