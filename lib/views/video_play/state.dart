import 'package:get/get.dart';
import 'package:pinker/common/index.dart';

class VideoPlayerViewState {
  // 是否需要重试
  final _isRetry = false.obs;
  set isRetry(bool value) => _isRetry.value = value;
  bool get isRetry => _isRetry.value;

  // 页面控制器
  final _pageIndex = 0.obs;
  set pageIndex(int value) => _pageIndex.value = value;
  int get pageIndex => _pageIndex.value;

  // 按钮是否被选中的状态控制器
  final _chooise = [0, 0].obs;
  set chooise(List<int> value) => _chooise.value = value;
  List<int> get chooise => _chooise;

  // 影片列表
  final resourceList = DataResourceList.fromJson(DataResourceList.child).obs;

  // 当前没播放的影片数据
  final resourceData = DataResourceModel.fromJson(DataResourceModel.child).obs;

  // 播放器地址
  final _videoUrl = ''.obs;
  set videoUrl(String value) => _videoUrl.value = value;
  String get videoUrl => _videoUrl.value;

  // 图片地址
  final _imagetUrl = ''.obs;
  set imagetUrl(String value) => _imagetUrl.value = value;
  String get imagetUrl => _imagetUrl.value;
}
