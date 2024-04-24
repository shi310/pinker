import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/index.dart';
import 'index.dart';

class ResourceMovieController extends GetxController {
  final state = ResourceMovieState();
  final scrollController = ScrollController();
  final type = 1;

  // 影片类型的名称
  final types = ['电影', '电视剧', '综艺', '动漫', '午夜剧场'];

  void typesClick(int typeIndex, String typaName, int index) {
    state.chooseIndex[typeIndex] = index;
    state.dataResponseSearch.update((val) {
      val!.country = index;
    });
  }

  Future<void> getResourceType({
    required int type,
  }) async {
    final response = await ResourceApi.getResourceType(
        type: type,
        errorCallBack: (erro) async {
          await MyTimer.futureDelayed(1000);
          await getResourceType(
            type: type,
          );
        });

    if (response != null && response.code == 200) {
      final data = MediaTypeList.fromJson(response.data);

      state.movieTypeList.update((val) {
        val!.list = data.list;
        val.size = data.size;
      });
    }
  }

  Future<void> getMedias({
    required int type,
    int? mediaType,
    int? pageNo,
    int? pageSize,
    int? country,
    String? keyword,
    int? year,
    int? sort,
  }) async {
    final response = await ResourceApi.getResourceList(
        type: type,
        mediaType: mediaType,
        pageNo: pageNo,
        pageSize: pageSize,
        country: country,
        keyword: keyword,
        year: year,
        sort: sort,
        errorCallBack: (erro) async {
          await MyTimer.futureDelayed(1000);
          await getMedias(
            type: type,
            mediaType: mediaType,
            pageNo: pageNo,
            pageSize: pageSize,
            country: country,
            keyword: keyword,
            year: year,
            sort: sort,
          );
        });

    if (response != null && response.code == 200) {
      final data = DataResourceList.fromJson(response.data);

      state.medias.update((val) {
        val!.list = data.list;
        val.size = data.size;
      });

      state.isLoading = false;
    } else {
      state.isLoading = true;
    }
  }

  @override
  void onReady() async {
    super.onReady();
    await getResourceType(type: type);
    await getMedias(type: 0);

    debounce(state.dataResponseSearch, (DataResponseSearch value) async {
      state.isLoading = true;

      state.medias.update((val) {
        val!.list.clear();
        val.size = 0;
      });

      await getMedias(
        type: value.type,
        mediaType: value.mediaType,
        pageNo: value.pageNo,
        pageSize: value.pageSize,
        country: value.country,
        keyword: value.keyword,
        year: value.year,
        sort: value.sort,
      );
    }, time: const Duration(milliseconds: 1500));
  }
}
