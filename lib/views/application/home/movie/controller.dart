import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../common/index.dart';
import 'index.dart';

class MovieViewController extends GetxController {
  final state = MovieViewState();
  final pageController = PageController();

  @override
  Future<void> onReady() async {
    await getBanners();
    await getMdeias();
    super.onReady();
  }

  /// 需要banner的数据
  Future<void> getBanners() async {
    var response = await HomeApi.getBanners(type: 1);

    if (response != null && response.code == 200) {
      var data = DataHomeModelBanners.fromJson(response.data);
      state.banners.update((val) {
        val!.list = data.list;
      });
    }
  }

  // 需要影视列表
  Future<void> getMdeias() async {
    var response = await HomeApi.getMdeias(type: 1);

    if (response != null && response.code == 200) {
      var data = DataHomeModelMedias.fromJson(response.data);
      state.medias.update((val) {
        val!.list = data.list;
      });
    }
  }

  void onPageChanged(int index) {
    state.index = index;
  }
}
