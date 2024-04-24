import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pinker/views/index.dart';

import '../../../../common/index.dart';

class HomeSeriesViewController extends GetxController {
  final state = HomeSeriesViewState();
  final pageController = PageController();
  final scrollController = ScrollController();
  final HomeController homeController = Get.find();

  @override
  Future<void> onReady() async {
    super.onReady();

    scrollController.addListener(() {
      homeController.state.offset = scrollController.offset;
    });

    await getBanners();
    await getMdeias();
  }

  /// 需要banner的数据
  Future<void> getBanners() async {
    var response = await HomeApi.getBanners(
        type: 1,
        errorCallBack: (erro) async {
          await MyTimer.futureDelayed(1000);
          await getBanners();
        });

    if (response != null && response.code == 200) {
      var data = DataHomeModelBanners.fromJson(response.data);
      state.banners.update((val) {
        val!.list = data.list;
      });
    }
  }

  // 需要影视列表
  Future<void> getMdeias() async {
    var response = await HomeApi.getMdeias(
        type: 1,
        errorCallBack: (erro) async {
          await MyTimer.futureDelayed(1000);
          await getMdeias();
        });

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
