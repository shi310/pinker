import 'package:get/get.dart';

class ApplicationState {
  final _index = 0.obs;
  set index(int value) => _index.value = value;
  int get index => _index.value;
}
