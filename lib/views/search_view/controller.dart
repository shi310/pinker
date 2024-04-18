import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/index.dart';

import 'index.dart';

class SearchViewViewController extends GetxController {
  final state = SearchViewState();

  final inputController = TextEditingController();
  final inputFocusNode = FocusNode();
  final scrollController = ScrollController();

  bool isLockFocus = false;

  final String searchWord = Get.arguments;

  final cancelToken = CancelToken();

  Future<void> getHotList() async {
    final response = await ResourceApi.getHotList(type: 1);

    if (response != null && response.code == 200) {
      var data = DataResourceList.fromJson(response.data);

      state.hotList.update((val) {
        val!.list = data.list;
        val.size = data.size;
      });
    }
  }

  void history(int index) {
    inputFocusNode.unfocus();
    inputController.text = state.history[index];
    searchView(state.history[index]);
  }

  void clearHistory() {
    state.history.clear();
    SharedService.to.remove(sharedSearchHistoryKey);
    Get.back();
  }

  void clear() {
    if (inputFocusNode.hasFocus) inputFocusNode.unfocus();
  }

  void searchView(String text) async {
    String textValue = text;

    if (textValue.isEmpty) {
      inputController.text = textValue;
    }

    state.isShowLoading = true;

    state.history.add(textValue);
    state.history = state.history.toSet().toList();
    SharedService.to.setList(sharedSearchHistoryKey, state.history);

    var response = await ResourceApi.getResourceList(
      type: 0,
      pageNo: 1,
      pageSize: 20,
      keyword: textValue,
      cancelToken: cancelToken,
    );

    if (response != null && response.code == 200) {
      var searchViewList = DataResourceList.fromJson(response.data);

      state.resault.update((val) {
        val!.list = searchViewList.list;
        val.size = searchViewList.size;
      });

      state.isRetryResault = false;
    } else {
      state.isRetryResault = true;
    }

    state.isShowLoading = false;
    state.isShowResault = true;
  }

  @override
  void dispose() {
    cancelToken.cancel();
    scrollController.dispose();
    inputController.dispose();
    inputFocusNode.dispose();

    super.dispose();
  }

  @override
  void onReady() async {
    super.onReady();
    inputController.text = searchWord;

    inputController.addListener(() {
      if (inputController.text.isEmpty) {
        state.resault.update((val) {
          val!.list.clear();
          val.size = 0;
        });
        state.isShowResault = false;
      }
    });

    debounce(
      state.scrollOffet,
      (callback) {
        if (scrollController.hasClients &&
            !scrollController.position.isScrollingNotifier.value) {
          isLockFocus = false;
        }
      },
      time: const Duration(milliseconds: 200),
    );

    scrollController.addListener(() {
      state.scrollOffet.value = scrollController.offset;
      if (!isLockFocus) {
        inputFocusNode.unfocus();
        isLockFocus = true;
      }
    });

    await Future.delayed(const Duration(milliseconds: 3000));
    inputFocusNode.requestFocus();

    await getHotList();
  }
}
