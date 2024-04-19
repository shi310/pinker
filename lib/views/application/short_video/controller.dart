import 'package:get/get.dart';
import 'package:pinker/common/index.dart';
import 'package:pinker/views/index.dart';
import 'package:video_player/video_player.dart';

class ShortVideoController extends GetxController {
  final state = ShortVideoState();
  final ApplicationController applicationController = Get.find();

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

    print('\n');

    print(state.shortList.value.list.length);
    print(videoPlayerControllers.length);

    print('\n');
  }

  // 初始化控制器
  // 以 pageIndex 为中心，初始化前5个和5个

  void initVideoController(int index) {
    for (int i = 0; i < state.shortList.value.list.length; i++) {
      if (i < index - 5 || i > index + 5) {
        videoPlayerControllers[i]?.pause().then((value) {
          return videoPlayerControllers[i]?.dispose();
        }).then((value) => videoPlayerControllers[i] = null);
      } else {
        if (videoPlayerControllers[i] == null) {
          videoPlayerControllers[i] = VideoPlayerController.networkUrl(
              Uri.parse(state.shortList.value.list[i].playUrls[0].urls[0]));
          try {
            videoPlayerControllers[i]!.initialize();
          } catch (e) {
            print(e);
          }
        }
      }
    }
  }

  void onPageChanged(int index) {
    pageIndex = index;
    if (index != 0) {
      videoPlayerControllers[index - 1]?.pause();
    }
    if (index != videoPlayerControllers.length - 1) {
      videoPlayerControllers[index + 1]?.pause();
    }
    videoPlayerControllers[index]?.play();
    initVideoController(index);

    if (index == state.shortList.value.list.length - 5) {
      getShortList();
    }
  }

  @override
  void onReady() {
    super.onReady();
    getShortList().then((value) {
      initVideoController(0);
    });

    ever(applicationController.state.pageIndex, (index) {
      if (index != 2) {
        videoPlayerControllers[pageIndex]?.pause();
      } else {
        videoPlayerControllers[pageIndex]?.play();
      }
    });
  }
}
