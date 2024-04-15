import 'package:get/get.dart';

class WelcomeState {
  final pageIndexRx = 0.obs;
  set pageIndex(int value) => pageIndexRx.value = value;
  int get pageIndex => pageIndexRx.value;
}
