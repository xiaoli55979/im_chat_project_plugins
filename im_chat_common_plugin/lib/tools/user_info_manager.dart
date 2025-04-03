import '../models/user_info_model_entity.dart';

class UserInfoManager {
  // 单例实例
  static final UserInfoManager _instance = UserInfoManager._internal();

  // 私有构造函数
  UserInfoManager._internal();

  // 提供外部访问的工厂构造方法
  factory UserInfoManager() => _instance;

  // 用户信息
  UserInfoModelEntity? userInfo;

  // 设置用户信息
  void setUserInfo(UserInfoModelEntity info) {
    userInfo = info;
  }

  // 获取用户信息
  UserInfoModelEntity? get getUserInfo => userInfo;

  // 清空用户信息（退出登录）
  void clearUserInfo() {
    userInfo = null;
  }
}
