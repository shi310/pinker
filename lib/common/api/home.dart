import 'package:dio/dio.dart';

import '../index.dart';

class HomeApi {
  /// 获取首页数据
  static Future<ResponseModel?> getBanners({
    required int type,
    void Function(int, int)? onReceiveProgress,
    Future<void> Function(ErrorModel)? errorCallBack,
    CancelToken? cancelToken,
  }) async {
    Response? response = await DioService.to.get(
      '/home/getBanners',
      queryParameters: {'type': type},
      onReceiveProgress: onReceiveProgress,
      errorCallBack: errorCallBack,
      cancelToken: cancelToken,
    );

    return response != null ? ResponseModel.fromJson(response.data) : null;
  }

  /// 获取媒体列表
  static Future<ResponseModel?> getMdeias({
    required int type,
    void Function(int, int)? onReceiveProgress,
    Future<void> Function(ErrorModel)? errorCallBack,
    CancelToken? cancelToken,
  }) async {
    Response? response = await DioService.to.get(
      '/home/getMedias',
      queryParameters: {'type': type},
      onReceiveProgress: onReceiveProgress,
      errorCallBack: errorCallBack,
      cancelToken: cancelToken,
    );

    return response != null ? ResponseModel.fromJson(response.data) : null;
  }

  /// 获取搜索关键字
  static Future<ResponseModel?> getSearchWord({
    Future<void> Function(ErrorModel)? errorCallBack,
    CancelToken? cancelToken,
  }) async {
    Response? response = await DioService.to.get(
      '/home/getSearchWord',
      errorCallBack: errorCallBack,
      cancelToken: cancelToken,
    );

    return response != null ? ResponseModel.fromJson(response.data) : null;
  }
}
