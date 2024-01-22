import '../../utils/log_utils.dart';

enum HttpMethod { get, post, delete }

/// 基础请求
abstract class BaseRequest {
  var pathParams;
  var useHttps = true;

  String authority() {
    return "api.devio.org";
  }

  HttpMethod httpMethod();

  String path();

  String url() {
    Uri uri;
    var pathStr = path();
    // 拼接 path 参数
    if (pathParams != null) {
      if (path().endsWith("/")) {
        pathStr = "${path()}$pathParams";
      } else {
        pathStr = "${path()}/$pathParams";
      }
    }

    // http 和 https 切换
    if (useHttps) {
      uri = Uri.https(authority(), pathStr, params);
    } else {
      uri = Uri.http(authority(), pathStr, params);
    }

    if (needLogin()) {
      // 给需要登录的接口携带登录令牌
      // addHeader(LoginDao.BOARDING_PASS, LoginDao.getBoardingPass());
    }

    Log.d('url:${uri.toString()}');

    return uri.toString();
  }

  bool needLogin();

  Map<String, String> params = {};

  /// 添加参数
  BaseRequest add(String k, Object v) {
    params[k] = v.toString();
    return this;
  }

  Map<String, String> header = {
    'course-flag': 'fa',
    'auth-token': 'MjAyMC0wNi0yMyAwMzoyNTowMQ==fa'
  };

  /// 添加 header
  BaseRequest addHeader(String k, Object v) {
    header[k] = v.toString();
    return this;
  }
}
