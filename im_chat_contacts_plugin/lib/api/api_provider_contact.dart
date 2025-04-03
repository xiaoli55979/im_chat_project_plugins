import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';

class ApiProviderContact extends BaseProvider {
  /// 同步好友
  // Future<Result> friendSync({
  //   String apiVersion = "1",
  //   int limit = 100,
  //   int version = 0,
  // }) async {
  //   final response = get('/api/v1/friend/sync?limit=$limit&version=$version&api_version=$apiVersion');
  //
  //   print("friendSync: $response");
  //   if (response is Map<String, dynamic>) {
  //     return response; // 直接返回原始 Map
  //   }
  //
  //   // 如果格式不符合预期，返回空列表
  //   print("响应格式不符合预期: $response");
  //
  //   return {};
  // }

  Future<Result<List<FriendModelEntity>>> friendSync({
    String apiVersion = "1",
    int limit = 100,
    int version = 0,
  }) =>
      get(
        "/v1/friend/sync?limit=$limit&version=$version&api_version=$apiVersion",
        decoder: (obj) => Result<List<FriendModelEntity>>.fromJson(obj),
      );
}
