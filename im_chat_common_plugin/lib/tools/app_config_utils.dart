import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';
import 'package:im_chat_common_plugin/models/global_info_entity.dart';
import 'package:im_chat_common_plugin/models/person_info_entity.dart';
import 'package:logging/logging.dart'; // 日志记录

class AppConfigUtils {
  // ---------- 单例优化 ----------
  static final AppConfigUtils _instance = AppConfigUtils._internal();
  factory AppConfigUtils() => _instance;
  AppConfigUtils._internal() {
    _init(); // 初始化时加载配置
  }

  // ---------- 成员变量 ----------
  GlobalInfoEntity? _globalConf; // 全局配置
  PersonInfoEntity? _personConf; // 角色配置
  UserInfoModelEntity? _ownConf; // 当前配置
  final Logger _logger = Logger('AppConfigUtils'); // 日志工具

  // ---------- 初始化方法 ----------
  Future<void> _init() async {
    try {
      _globalConf = MySharedPref.getGlobalConf();
      _personConf = MySharedPref.getPersonConf();
      _ownConf = MySharedPref.getOwnConf();
    } catch (e, stackTrace) {
      _logger.severe('初始化全局配置失败', e, stackTrace);
      _globalConf = GlobalInfoEntity(); // 提供默认值
      _personConf = PersonInfoEntity();
      _ownConf = UserInfoModelEntity();
    }
  }

  // ---------- Getter/Setter ----------
  /// 获取全局配置（确保非空）
  GlobalInfoEntity get globalConf {
    return _globalConf ?? GlobalInfoEntity(); // 兜底默认值
  }

  /// 更新全局配置
  Future<void> setGlobalConf(GlobalInfoEntity model) async {
    try {
      MySharedPref.setGlobalConf(model);
      _globalConf = model;
    } catch (e, stackTrace) {
      _logger.severe('保存全局配置失败', e, stackTrace);
      rethrow; // 根据需求决定是否重新抛出异常
    }
  }

  /// 获取角色配置（确保非空）
  PersonInfoEntity get personConf {
    return _personConf ?? PersonInfoEntity(); // 兜底默认值
  }

  /// 更新角色配置
  Future<void> setPersonConf(PersonInfoEntity model) async {
    try {
      MySharedPref.setPersonConf(model);
      _personConf = model;
    } catch (e, stackTrace) {
      _logger.severe('保存角色配置失败', e, stackTrace);
      rethrow; // 根据需求决定是否重新抛出异常
    }
  }

  /// 获取当前登录配置（确保非空）
  UserInfoModelEntity get ownConf {
    return _ownConf ?? UserInfoModelEntity(); // 兜底默认值
  }

  /// 更新当前登录配置
  Future<void> setOwnConf(UserInfoModelEntity model) async {
    try {
      MySharedPref.setOwnConf(model);
      _ownConf = model;
    } catch (e, stackTrace) {
      _logger.severe('保存当前登录配置失败', e, stackTrace);
      rethrow; // 根据需求决定是否重新抛出异常
    }
  }

  // ---------- 辅助方法 ----------
  /// 强制刷新配置（例如网络重试）
  Future<void> refreshConf() async {
    await _init();
  }

}