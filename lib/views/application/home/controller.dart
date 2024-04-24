import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pinker/common/index.dart';

import 'index.dart';

class HomeController extends GetxController {
  final state = HomeState();

  // 影片类型的名称
  final types = ['电影', '电视剧', '综艺', '动漫', '午夜剧场'];

  // 收藏记录：ID
  final favoritesId = SharedService.to.getList(sharedFavoritesIdKey).obs;
  final favoritesList = DataResourceList.fromJson(DataResourceList.child).obs;

  // 热门搜索
  final hotList = DataResourceList.fromJson(DataResourceList.child).obs;

  // 短视频列表
  final shortList = DataResourceList.fromJson(DataResourceList.child).obs;

  @override
  void onReady() async {
    super.onReady();

    ever(state.pageIindex, (callback) {
      switch (callback) {
        case 0:
          final HomeMoviesViewController homeMoviesViewController = Get.find();

          state.offset = homeMoviesViewController.scrollController.offset;
          break;
        case 1:
          final HomeSeriesViewController homeSeriesViewController = Get.find();

          state.offset = homeSeriesViewController.scrollController.offset;
          break;

        default:
      }
    });

    await getSearchWord();
  }

  void onSearchView() {
    Get.toNamed(MyRoutes.search, arguments: state.searchWord);
  }

  Future<void> getSearchWord() async {
    var response = await HomeApi.getSearchWord(
      errorCallBack: (erro) async {
        await MyTimer.futureDelayed(1000);
        await getSearchWord();
      },
    );

    if (response != null && response.code == 200) {
      var data = DataHomeModelSearchWord.fromJson(response.data);
      state.searchWord = data.searchWord;
    }
  }

  void onTabBar(BuildContext buildContext, int index) {
    if (state.pageIindex.value == index) return;
    state.pageIindex.value = index;
  }
}
