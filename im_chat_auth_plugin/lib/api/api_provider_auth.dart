import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';

class ApiProviderAuth extends BaseProvider {
  /// 登录
  Future<Result<UserInfoModelEntity>> login({
    required String username,
    required String password,
    String lang = "zh-Hans",
    required Map<String, dynamic> device,
  }) =>
      post(
        '/v1/user/login',
        {
          'username': username,
          'password': password,
          'lang': lang,
          'device': device,
        },
        decoder: (obj) => Result<UserInfoModelEntity>.fromJson(obj),
      );

  /// 注册
  Future<Result<UserInfoModelEntity>> register({
    required String phone,
    required String name,
    required String zone,
    required String password,
    String lang = "zh-Hans",
    String inviteCode = "",
    required String code,
    required Map<String, dynamic> device,
  }) =>
      post(
        '/v1/user/register',
        {
          'zone': zone,
          'phone': phone,
          'code': code,
          'flag': 0,
          'password': password,
          'name': name,
          'lang': lang,
          'invite_code': inviteCode,
          'device': device,
        },
        decoder: (obj) => Result<UserInfoModelEntity>.fromJson(obj),
      );
}
