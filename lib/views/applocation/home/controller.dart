import 'package:get/get.dart';

import '../../../common/index.dart';
import 'index.dart';

class HomeController extends GetxController {
  final state = HomeState();

  void changeTheme() {
    ConfigController.to.changeThemeMode();
  }

  void signIn() {
    Get.toNamed(MyRoutes.signIn);
    // The following line will enable the Android and iOS wakelock.
  }

  void signUp() {
    Get.toNamed(MyRoutes.signUp);
  }
}
