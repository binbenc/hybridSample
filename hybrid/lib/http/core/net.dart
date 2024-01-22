import '../../utils/log_utils.dart';
import '../request/base_request.dart';
import 'dio_adapter.dart';
import 'error.dart';
import 'net_adapter.dart';

class Net {
  Net._();

  static final Net _instance = Net._(); // 将声明和初始化合并到一行
  static Net getInstance() {
    return _instance;
  }

  Future request(BaseRequest request) async {
    late BaseNetResponse response; // 添加初始值为null
    var error;

    try {
      response = await _request(request);
    } on NetError catch (e) {
      error = e;
      response = e.data;
      Log.d(e.message);
    } catch (e) {
      // 其他异常
      error = e;
      Log.d(e);
    }

    var result = response.data;
    Log.d(response);

    var status = response.statusCode;
    switch (status) {
      case 200:
        return result;
      case 401:
        throw NeedLogin();
      case 403:
        throw NeedAuth(result.toString(), data: result);
      default:
        throw NetError(code: status, message: result.toString(), data: result);
    }
  }

  Future<dynamic> _request<T>(BaseRequest request) async {
    Log.d('url:${request.url()}');

    /// 使用 Dio 发送请求
    DioAdapter adapter = DioAdapter();
    return adapter.request(request);
  }
}
