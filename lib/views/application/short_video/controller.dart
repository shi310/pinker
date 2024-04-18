import 'package:get/get.dart';
import 'package:pinker/common/index.dart';
import 'index.dart';

class ShortVideoController extends GetxController {
  final state = ShortVideoState();

  int pageIndex = 0;

  // 需要影视列表
  Future<void> getShortList() async {
    var response = await ResourceApi.getResourceList(type: 1);

    if (response != null && response.code == 200) {
      var data = DataResourceList.fromJson(response.data);
      state.shortList.update((val) {
        val!.list = data.list;
        val.size = data.size;
      });
      state.isShowLoading = false;
    }
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await getShortList();
  }
}
