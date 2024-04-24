import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'index.dart';

class ResourceHallController extends GetxController {
  final state = ResourceHallState();
  final scrollController = ScrollController();

  // 影片类型的名称
  final types = ['电影', '电视剧', '综艺', '动漫', '午夜剧场'];

  void onTabBar(BuildContext buildContext, int index) {
    if (state.index == index) return;
    state.index = index;
  }
}
