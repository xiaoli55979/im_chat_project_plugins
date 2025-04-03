import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';

class ApiProviderSetting extends BaseProvider {
  /// 登录
  Future<Result> loginOut() => delete(
        '/api/v1/user/device_token',
        decoder: (obj) => Result.fromJson(obj),
      );
}
