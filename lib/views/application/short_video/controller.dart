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
  }

  void onVideoPlayer(int index, DataResourceModel value) {
    videoPlayerControllers[index]?.pause();
    Get.toNamed(MyRoutes.videoPlay, arguments: value)?.then((value) {
      videoPlayerControllers[index]?.play();
    });
  }

  void onPageChanged(int index) {
    videoPlayerControllers[pageIndex]?.pause();

    if (index < pageIndex) {
      if (pageIndex + 2 < videoPlayerControllers.length) {
        videoPlayerControllers[pageIndex + 2]?.dispose();
        videoPlayerControllers[pageIndex + 2] = null;
      }

      if (pageIndex - 3 >= 0) {
        videoPlayerControllers[pageIndex - 3] =
            VideoPlayerController.networkUrl(Uri.parse(
                state.shortList.value.list[pageIndex - 3].playUrls[0].urls[0]));
        videoPlayerControllers[pageIndex - 3]?.initialize();
      }
    } else {
      if (pageIndex - 2 >= 0) {
        videoPlayerControllers[pageIndex - 2]?.dispose();
        videoPlayerControllers[pageIndex - 2] = null;
      }

      if (pageIndex + 3 < videoPlayerControllers.length) {
        videoPlayerControllers[pageIndex + 3] =
            VideoPlayerController.networkUrl(Uri.parse(
                state.shortList.value.list[pageIndex + 3].playUrls[0].urls[0]));
        videoPlayerControllers[pageIndex + 3]?.initialize();
      }
    }

    pageIndex = index;

    videoPlayerControllers[index]?.play();

    if (index == state.shortList.value.list.length - 5) {
      getShortList();
    }
  }

  @override
  void onReady() {
    super.onReady();
    getShortList().then((value) {
      videoPlayerControllers[0] = VideoPlayerController.networkUrl(
          Uri.parse(state.shortList.value.list[0].playUrls[0].urls[0]));
      videoPlayerControllers[0]?.initialize();

      videoPlayerControllers[1] = VideoPlayerController.networkUrl(
          Uri.parse(state.shortList.value.list[1].playUrls[0].urls[0]));
      videoPlayerControllers[1]?.initialize();

      videoPlayerControllers[2] = VideoPlayerController.networkUrl(
          Uri.parse(state.shortList.value.list[2].playUrls[0].urls[0]));
      videoPlayerControllers[2]?.initialize();
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
