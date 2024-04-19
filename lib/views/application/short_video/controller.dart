import 'package:get/get.dart';
import 'package:pinker/common/index.dart';
import 'package:video_player/video_player.dart';
import 'index.dart';

class ShortVideoController extends GetxController {
  final state = ShortVideoState();

  // 视频控制器的集合，每一个视频都有一个控制
  // 加载方式：懒加载
  // 控制最大个数：11个（ 前5个 --- 当前视频 --- 后5个）
  List<VideoPlayerController?> videoPlayerControllers = [];

  int pageIndex = 0;

  // 需要影视列表
  Future<void> getShortList() async {
    var response = await ResourceApi.getResourceList(type: 1);

    if (response != null && response.code == 200) {
      var data = DataResourceList.fromJson(response.data);
      state.shortList.update((val) {
        val!.list.addAll(data.list);
        val.size += data.size;
      });

      // 创建包含指定数量 null 的列表
      List<VideoPlayerController?> list = List.filled(data.list.length, null);
      videoPlayerControllers.addAll(list);

      state.isShowLoading = false;
    }
  }

  // 初始化控制器
  // 以 pageIndex 为中心，初始化前5个和5个

  void initVideoController(int index) {
    for (int i = 0; i < state.shortList.value.list.length; i++) {
      if (i < index - 5 || i > index + 5) {
        videoPlayerControllers[i]?.pause();
        videoPlayerControllers[i]?.dispose();
        videoPlayerControllers[i] = null;
      } else {
        if (videoPlayerControllers[i] == null) {
          videoPlayerControllers[i] = VideoPlayerController.networkUrl(
              Uri.parse(state.shortList.value.list[i].playUrls[0].urls[0]));
          videoPlayerControllers[i]!.initialize();
        }
      }
    }

    MyLogger.w(state.shortList.value.list.length.toString());
    MyLogger.w(videoPlayerControllers.toString());
  }

  void onPageChanged(int index) {
    pageIndex = index;
    if (index != 0) {
      videoPlayerControllers[index - 1]?.pause();
    }
    videoPlayerControllers[index]?.play();
    initVideoController(index);
  }

  @override
  void onReady() {
    super.onReady();
    getShortList().then((value) {
      initVideoController(0);
      videoPlayerControllers[0]?.play();
    });
  }
}
