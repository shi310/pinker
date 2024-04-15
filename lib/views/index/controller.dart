import 'dart:async';

import 'package:get/get.dart';

import '../../common/index.dart';
import '../index.dart';

class IndexController extends GetxController {
  final state = IndexState();
  late Timer _timer;
  final int advertiseTime = 6;

  @override
  void onReady() {
    super.onReady();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        state.timer++;
        if (state.timer >= advertiseTime) {
          stopTimer();
          onApplicationView();
        }
      },
    );
  }

  void stopTimer() {
    _timer.cancel();
  }

  void onApplicationView() {
    stopTimer();
    Get.offAllNamed(MyRoutes.welcome);
  }

  @override
  void onClose() {
    stopTimer();
    super.onClose();
  }
}
