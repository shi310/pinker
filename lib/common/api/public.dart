import 'package:dio/dio.dart';

import '../index.dart';

class PublicApi {
  /// 登陆
  static Future<ResponseModel?> getNoticeList({
    Future<void> Function(ErrorModel)? errorCallBack,
    CancelToken? cancelToken,
  }) async {
    Response? response = await DioService.to.get(
      '/public/notice',
      options: Options(
        headers: {'token': UserController.to.token},
      ),
      errorCallBack: errorCallBack,
      cancelToken: cancelToken,
    );

    return response != null ? ResponseModel.fromJson(response.data) : null;
  }
}
