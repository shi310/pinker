import 'package:get/get.dart';

import '../../../../common/index.dart';

class ResourceMovieState {
  final dataResponseSearch = DataResponseSearch.fromJson(
    DataResponseSearch.child,
  ).obs;

  final chooseIndex = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0].obs;

  final movieTypeList = MediaTypeList.fromJson(
    MediaTypeList.child,
  ).obs;

  final _isLoading = true.obs;
  set isLoading(bool value) => _isLoading.value = value;
  bool get isLoading => _isLoading.value;

  final medias = DataResourceList.fromJson(DataResourceList.child).obs;
}
