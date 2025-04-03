import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'im_chat_home_plugin_platform_interface.dart';

/// An implementation of [ImChatHomePluginPlatform] that uses method channels.
class MethodChannelImChatHomePlugin extends ImChatHomePluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('im_chat_home_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
