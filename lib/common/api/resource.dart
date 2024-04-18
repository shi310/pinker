import 'package:dio/dio.dart';

import '../index.dart';

class ResourceApi {
  static Future<ResponseModel?> getResourceList({
    required int type,
    int? pageNo,
    void Function(int, int)? onReceiveProgress,
    int? pageSize,
    int? sort,
    int? mediaType,
    int? country,
    String? keyword,
    int? year,
    int? guessId,
    Future<void> Function(ErrorModel)? errorCallBack,
    CancelToken? cancelToken,
  }) async {
    Response? response = await DioService.to.get(
      '/resource/getResourceList',
      options: Options(headers: {'token': UserController.to.token}),
      queryParameters: {
        'type': type,
        'pageNo': pageNo,
        'pageSize': pageSize ?? 20,
        'sort': sort,
        'mediaType': mediaType,
        'country': country,
        'keyword': keyword,
        'year': year,
        'guessId': guessId,
      },
      onReceiveProgress: onReceiveProgress,
      errorCallBack: errorCallBack,
      cancelToken: cancelToken,
    );

    return response != null ? ResponseModel.fromJson(response.data) : null;
  }

  static Future<ResponseModel?> getHotList({
    required int type,
    int? pageNo,
    void Function(int, int)? onReceiveProgress,
    int? pageSize,
    Future<void> Function(ErrorModel)? errorCallBack,
    CancelToken? cancelToken,
  }) async {
    Response? response = await DioService.to.get(
      '/resource/getHotList',
      options: Options(headers: {'token': UserController.to.token}),
      queryParameters: {
        'type': type,
        'pageNo': pageNo,
        'pageSize': pageSize ?? 20,
      },
      onReceiveProgress: onReceiveProgress,
      errorCallBack: errorCallBack,
      cancelToken: cancelToken,
    );

    return response != null ? ResponseModel.fromJson(response.data) : null;
  }

  static Future<ResponseModel?> getResourceType({
    required int type,
    Future<void> Function(ErrorModel)? errorCallBack,
    CancelToken? cancelToken,
  }) async {
    Response? response = await DioService.to.get(
      '/resource/getResourceType',
      errorCallBack: errorCallBack,
      queryParameters: {'type': type},
      cancelToken: cancelToken,
    );
    return response != null ? ResponseModel.fromJson(response.data) : null;
  }

  static Future<ResponseModel?> getResourceData({
    required int id,
    Future<void> Function(ErrorModel)? errorCallBack,
    CancelToken? cancelToken,
  }) async {
    Response? response = await DioService.to.get(
      '/resource/getResourceData',
      errorCallBack: errorCallBack,
      queryParameters: {'id': id},
      options: Options(headers: {'token': UserController.to.token}),
      cancelToken: cancelToken,
    );
    return response != null ? ResponseModel.fromJson(response.data) : null;
  }
}
