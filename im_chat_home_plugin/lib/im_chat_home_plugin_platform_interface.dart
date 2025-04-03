import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'im_chat_home_plugin_method_channel.dart';

abstract class ImChatHomePluginPlatform extends PlatformInterface {
  /// Constructs a ImChatHomePluginPlatform.
  ImChatHomePluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static ImChatHomePluginPlatform _instance = MethodChannelImChatHomePlugin();

  /// The default instance of [ImChatHomePluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelImChatHomePlugin].
  static ImChatHomePluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ImChatHomePluginPlatform] when
  /// they register themselves.
  static set instance(ImChatHomePluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
