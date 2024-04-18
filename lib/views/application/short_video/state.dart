import 'package:get/get.dart';
import 'package:pinker/common/index.dart';

class ShortVideoState {
  final _isShowLoading = true.obs;
  set isShowLoading(bool value) => _isShowLoading.value = value;
  bool get isShowLoading => _isShowLoading.value;

  final _pageIndex = 0.obs;
  set pageIndex(int value) => _pageIndex.value = value;
  int get pageIndex => _pageIndex.value;

  final shortList = DataResourceList.fromJson(DataResourceList.child).obs;
}
