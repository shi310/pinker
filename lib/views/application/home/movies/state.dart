import 'package:get/get.dart';
import 'package:pinker/common/index.dart';

class HomeMoviesViewState {
  final banners = DataHomeModelBanners.fromJson(DataHomeModelBanners.child).obs;
  final medias = DataHomeModelMedias.fromJson(DataHomeModelMedias.child).obs;

  final _index = 0.obs;
  set index(int value) => _index.value = value;
  int get index => _index.value;
}
