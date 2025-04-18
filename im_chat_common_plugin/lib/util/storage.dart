import 'package:get_storage/get_storage.dart';

class Storage {
  static const _kFriendSync = 'friend_sync';

  static Storage? _instance;
  static Storage shared() {
    if (_instance == null) {
      _instance = Storage();
      return _instance!;
    }
    return _instance!;
  }

  // 本地化存储，存APP内部
  static GetStorage? _getStorage;

  // runApp方法前调用
  static init() async {
    await GetStorage.init();
    _getStorage = GetStorage();
  }

  static Future<void> putFriendSync(bool friendSync) async {
    return _getStorage!.write(_kFriendSync, friendSync);
  }

  ///是否同步过通讯录数据
  static bool getFriendSync() {
    return _getStorage!.read<bool?>(_kFriendSync) ?? false;
  }
}
