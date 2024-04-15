import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/index.dart';
import 'package:pinker/views/index.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerViewController extends GetxController {
  final state = VideoPlayerViewState();

  final pageController = PageController();

  final DataResourceModel arguments = Get.arguments;

  final scrollController = ScrollController();

  final customControls = CupertinoControls(
    backgroundColor: MyColors.geryTranslucent.withOpacity(0.3),
    iconColor: MyColors.white,
  );

  final homeController = Get.find<HomeController>();

  bool isFavorites = false;

  ChewieController? chewieController;
  VideoPlayerController? videoPlayerController;

  void guessPlay(DataResourceModel resourceData) async {
    if (resourceData.id == state.resourceData.value.id) return;

    isFavorites = false;
    state.pageIndex = 0;
    state.chooise = [0, 0];
    state.resourceData.value = resourceData;
    state.resourceData.update((val) {});

    state.resourceList.value.list.clear();
    state.resourceList.update((val) {});

    for (var data in homeController.favoritesId) {
      if (data == resourceData.id.toString()) isFavorites = true;
    }
    getResourceList(resourceData.id);
    await initPlayer(resourceData.playUrls[0].urls[0]);
  }

  void listener() async {
    if (!chewieController!.isFullScreen) {
      // WakelockPlus.enable();

      await ConfigController.to.setPreferredOrientations();
      if (ConfigController.to.platform == 'android') {
        await ConfigController.to.setTransparentStatusBar();
      }
    }
  }

  Future<void> initPlayer(String url) async {
    if (videoPlayerController != null) {
      await videoPlayerController!.dispose();
      videoPlayerController = null;
      if (chewieController != null) {
        chewieController!.removeListener(listener);
        chewieController!.dispose();
        chewieController = null;
      }
    }

    state.isShowLoading = true;
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));
    await videoPlayerController!.initialize();

    if (videoPlayerController!.value.isInitialized) {
      chewieController = ChewieController(
        videoPlayerController: videoPlayerController!,
        autoPlay: false,
        customControls: customControls,
      );

      state.isShowLoading = false;

      chewieController!.addListener(listener);
    } else {
      videoPlayerController!.dispose();
      videoPlayerController = null;
    }
  }

  Future<void> getResourceList(int guessId) async {
    var getResoureList = await ResourceApi.getResourceList(
      type: 1,
      guessId: guessId,
    );

    if (getResoureList != null && getResoureList.code == 200) {
      var resoureList = DataResourceList.fromJson(getResoureList.data);

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
    state.resourceData.value = arguments;
    state.resourceData.update((value) {});

    // playUrl = state.resourceData.value.playUrls[0].urls[0];

    // state.isLoading = false;

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
    await getResourceList(state.resourceData.value.id);
    await initPlayer(state.resourceData.value.playUrls[0].urls[0]);

    super.onReady();
  }

  @override
  void onClose() {
    if (videoPlayerController != null) {
      videoPlayerController!.dispose();
    }

    if (chewieController != null) {
      chewieController!.removeListener(listener);
      chewieController!.dispose();
    }

    // WakelockPlus.disable();

    super.onClose();
  }
}
