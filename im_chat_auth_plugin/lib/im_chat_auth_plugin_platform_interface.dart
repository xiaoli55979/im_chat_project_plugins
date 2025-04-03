import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'im_chat_auth_plugin_method_channel.dart';

abstract class ImChatAuthPluginPlatform extends PlatformInterface {
  /// Constructs a ImChatAuthPluginPlatform.
  ImChatAuthPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static ImChatAuthPluginPlatform _instance = MethodChannelImChatAuthPlugin();

  /// The default instance of [ImChatAuthPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelImChatAuthPlugin].
  static ImChatAuthPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ImChatAuthPluginPlatform] when
  /// they register themselves.
  static set instance(ImChatAuthPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
