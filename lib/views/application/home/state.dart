import 'package:get/get.dart';
import 'package:pinker/common/index.dart';

class HomeState {
  final pageIindex = 0.obs;

  final _offset = 0.0.obs;
  set offset(double value) => _offset.value = value;
  double get offset => _offset.value;

  final _searchWord = Lang.search.tr.obs;
  set searchWord(String value) => _searchWord.value = value;
  String get searchWord => _searchWord.value;
}
