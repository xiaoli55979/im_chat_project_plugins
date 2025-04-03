
import 'im_chat_home_plugin_platform_interface.dart';

class ImChatHomePlugin {
  Future<String?> getPlatformVersion() {
    return ImChatHomePluginPlatform.instance.getPlatformVersion();
  }
}
