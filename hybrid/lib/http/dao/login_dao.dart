import 'package:hybrid/http/core/net.dart';

import '../../utils/log_utils.dart';
import '../request/base_request.dart';
import '../request/login_request.dart';

class LoginDao {
  static const BOARDING_PASS = "boarding-pass";

  static Future<Map<String, dynamic>> login(
      String userName, String password) async {
    return _send(userName, password);
  }

  static Future<Map<String, dynamic>> registration(
      String userName, String password, String imoocId, String orderId) async {
    return _send(userName, password, imoocId: imoocId, orderId: orderId);
  }

  static Future<Map<String, dynamic>> _send(String userName, String password,
      {String? imoocId, String? orderId}) async {
    BaseRequest request;

    request = LoginRequest();

    request.add("userName", userName).add("password", password);

    var result = await Net.getInstance().request(request);
    Log.d(result);

    if (result['code'] == 0 && result['data'] != null) {
      // 保存登录令牌
      // HiCache.getInstance().setString(BOARDING_PASS, result['data']);
    }

    return result;
  }

  // static Future<String?> getBoardingPass() async {
  //   return HiCache.getInstance().getString(BOARDING_PASS);
  // }
}
