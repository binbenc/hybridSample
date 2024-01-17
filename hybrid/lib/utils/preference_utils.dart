import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  PreferenceUtils._internal() {
    init();
  }

  factory PreferenceUtils() => _instance;

  static late PreferenceUtils _instance = PreferenceUtils._internal();

  SharedPreferences? _preferences;

  /// 初始化 SharedPreferences
  void init() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  /// 到这里还没有完 有时候会遇到使用时提示 SharedPreferences 未初始化,所以还需要提供一个static 的方法
  static Future<PreferenceUtils?> perInit() async {
    if (_instance == null) {
      //静态方法不能访问非静态变量所以需要创建变量再通过方法赋值回去
      SharedPreferences preferences = await SharedPreferences.getInstance();
      _instance = PreferenceUtils._pre(preferences);
    }

    return _instance;
  }

  PreferenceUtils._pre(SharedPreferences prefs) {
    _preferences = prefs;
  }

  /// 设置String类型
  void setString(key, value) {
    _preferences?.setString(key, value);
  }

  /// 设置setStringList类型
  void setStringList(key, value) {
    _preferences?.setStringList(key, value);
  }

  /// 设置setBool类型
  void setBool(key, value) {
    _preferences?.setBool(key, value);
  }

  /// 设置setDouble类型
  void setDouble(key, value) {
    _preferences?.setDouble(key, value);
  }

  /// 设置setInt类型
  void setInt(key, value) {
    _preferences?.setInt(key, value);
  }

  /// 通过泛型来获取数据
  T? get<T>(key) {
    var result = _preferences?.get(key);
    if (result != null) {
      return result as T;
    }
    return null;
  }

  /// 清除全部
  void clean() {
    _preferences?.clear();
  }

  /// 移除某一个
  void remove(key) {
    _preferences?.remove(key);
  }
}
