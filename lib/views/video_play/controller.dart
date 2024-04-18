import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/index.dart';
import 'package:pinker/views/index.dart';

class VideoPlayerViewController extends GetxController {
  final state = VideoPlayerViewState();
  final pageController = PageController();
  final DataResourceModel arguments = Get.arguments;
  final scrollController = ScrollController();
  final homeController = Get.find<HomeController>();

  bool isFavorites = false;

  void guessPlay(DataResourceModel resourceData) async {
    if (resourceData.id == state.resourceData.value.id) return;

    state.resourceData.value = resourceData;
    state.resourceData.update((val) {});

    state.videoUrl = resourceData.playUrls[0].urls[0];
    state.imagetUrl = resourceData.image;

    state.pageIndex = 0;
    state.chooise = [0, 0];
    isFavorites = false;

    state.resourceList.value.list.clear();
    state.resourceList.update((val) {});

    MyLogger.w(
      'video_play => resourceData刷新 : ${state.resourceData.value.toJson()}',
    );

    for (var data in homeController.favoritesId) {
      if (data == resourceData.id.toString()) isFavorites = true;
    }

    await getGuessDataList(resourceData.id);
    MyLogger.w(
      'video_play => resourceList刷新 : ${state.resourceList.value.toJson()}',
    );
  }

  Future<void> getGuessDataList(int guessId) async {
    var response = await ResourceApi.getResourceList(
      type: 1,
      guessId: guessId,
    );

    if (response != null && response.code == 200) {
      final resoureList = DataResourceList.fromJson(response.data);

      state.resourceList.update((val) {
        val!.list = resoureList.list;
        val.size = resoureList.size;
      });

      state.isRetry = false;
    } else {
      state.isRetry = true;
    }
  }

  Future<bool> onFavorites(bool value) async {
    isFavorites = !isFavorites;
    var favoritesId = homeController.favoritesId;

    if (isFavorites) {
      favoritesId.add(state.resourceData.value.id.toString());
      homeController.favoritesList.update((val) {
        val!.list.add(state.resourceData.value);
        val.size += 1;
      });
    } else {
      favoritesId.remove(state.resourceData.value.id.toString());
      homeController.favoritesList.update((val) {
        val!.list.remove(state.resourceData.value);
        val.size -= 1;
      });
    }

    SharedService.to.setList(sharedFavoritesIdKey, favoritesId);
    return isFavorites;
  }

  @override
  void onInit() {
    // 首先把拿到的视频数据传入视频组件
    // 这样视频组件就可以完成初始化
    state.videoUrl = arguments.playUrls[0].urls[0];
    state.imagetUrl = arguments.image;

    // 然后更新本页面的状态数据
    // 方便刷新界面
    state.resourceData.value = arguments;
    state.resourceData.update((value) {});

    // 比较本地的收藏列表数据
    // 如果发现ID一直，就打上已收藏的标志
    for (var data in homeController.favoritesId) {
      if (data == state.resourceData.value.id.toString()) isFavorites = true;
    }
    super.onInit();
  }

  void onTabBar(BuildContext context, int index) {
    state.pageIndex = index;
  }

  @override
  void onReady() async {
    // WakelockPlus.enable();
    // 拿到猜你喜欢的数据列表
    await getGuessDataList(state.resourceData.value.id);
    super.onReady();
  }
}
