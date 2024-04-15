import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pinker/common/index.dart';

import 'index.dart';

class HomeController extends GetxController {
  final state = HomeState();
  final scrollController = ScrollController();

  /// 影片类型的名称
  final types = ['电影', '电视剧', '综艺', '动漫', '午夜剧场'];

  /// 收藏记录：ID
  final favoritesId = SharedService.to.getList(sharedFavoritesIdKey).obs;
  final favoritesList = DataResourceList.fromJson(DataResourceList.child).obs;

  /// 热门搜索
  final hotList = DataResourceList.fromJson(DataResourceList.child).obs;

  /// 短视频列表
  final shortList = DataResourceList.fromJson(DataResourceList.child).obs;

  @override
  void onReady() async {
    super.onReady();

    scrollController.addListener(() {
      state.offset = scrollController.offset;
    });

    await getSearchWord();
  }

  void onSearchView() {}

  Future<void> getSearchWord() async {
    var response = await HomeApi.getSearchWord();

    if (response != null && response.code == 200) {
      var data = DataHomeModelSearchWord.fromJson(response.data);
      state.searchWord = data.searchWord;
    }
  }

  void onTabBar(BuildContext buildContext, int index) {
    if (state.index == index) return;
    state.index = index;
  }
}
