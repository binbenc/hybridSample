import 'dart:convert';

import '../request/base_request.dart';

abstract class NetAdapter {
  Future<BaseNetResponse<T>> request<T>(BaseRequest request);
}

/// 统一网络层返回格式
class BaseNetResponse<T> {
  BaseNetResponse({
    required this.data,
    required this.request,
    required this.statusCode,
    required this.statusMessage,
    required this.extra,
  });

  T data;
  BaseRequest request;
  int statusCode;
  String statusMessage;
  dynamic extra;

  @override
  String toString() {
    if (data is Map) {
      return json.encode(data);
    }
    return data.toString();
  }
}
