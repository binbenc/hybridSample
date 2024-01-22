import 'package:dio/dio.dart';
import 'package:hybrid/http/core/net_adapter.dart';
import 'package:hybrid/http/request/base_request.dart';

import 'error.dart';

/// Dio 适配器
class DioAdapter extends NetAdapter {
  @override
  Future<BaseNetResponse<T>> request<T>(BaseRequest request) async {
    var response, options = Options(headers: request.header);
    var error;

    try {
      if (request.httpMethod() == HttpMethod.get) {
        response = await Dio().get(request.url(), options: options);
      } else if (request.httpMethod() == HttpMethod.post) {
        response = await Dio()
            .post(request.url(), data: request.params, options: options);
      } else if (request.httpMethod() == HttpMethod.delete) {
        response = await Dio()
            .delete(request.url(), data: request.params, options: options);
      }
    } on DioException catch (e) {
      error = e;
      response = e.response;
    }

    if (error != null) {
      /// 抛出 NetError
      throw NetError(
          code: response?.statusCode ?? -1,
          message: error.toString(),
          data: await buildRes(response, request));
    }

    return await buildRes(response, request);
  }

  /// 构建 BaseNetResponse
  Future<BaseNetResponse<T>> buildRes<T>(
      Response response, BaseRequest request) async {
    return BaseNetResponse(
        data: response.data,
        request: request,
        statusCode: response.statusCode ?? -1,
        statusMessage: response.statusMessage ?? "",
        extra: response) as BaseNetResponse<T>;
  }
}
