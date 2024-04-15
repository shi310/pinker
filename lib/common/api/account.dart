import 'package:dio/dio.dart';

import '../index.dart';

class AccountApi {
  /// 登陆
  static Future<ResponseModel?> signIn({
    required String account,
    required String password,
    Future<void> Function(ErrorModel)? errorCallBack,
    CancelToken? cancelToken,
  }) async {
    Response? response = await DioService.to.post(
      '/account/signIn',
      data: {
        'account': account,
        'password': password,
      },
      errorCallBack: errorCallBack,
      cancelToken: cancelToken,
    );

    return response != null ? ResponseModel.fromJson(response.data) : null;
  }
}
