import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:im_chat_conversation_plugin/pages/bingings/chat_file_bindings.dart';
import 'package:im_chat_conversation_plugin/pages/views/chat_file_view.dart';

import '../pages/bingings/chat_bindings.dart';
import '../pages/bingings/chat_frequency_limit_bindings.dart';
import '../pages/bingings/chat_group_setting_bindings.dart';
import '../pages/bingings/chat_personal_setting_bindings.dart';
import '../pages/views/chat_frequency_limit_view.dart';
import '../pages/views/chat_group_setting_view.dart';
import '../pages/views/chat_personal_setting_view.dart';
import '../pages/views/chat_view.dart';
import 'app_routes_conversation.dart';

class AppPagesConversation {
  AppPagesConversation._();

  /// 路由管理
  static final routes = [
    /// chat
    GetPage(
      name: AppRoutesConversation.chat,
      page: () => ChatView(),
      bindings: [
        ChatBindings(),
      ],
    ),

    /// 个人聊天设置
    GetPage(
      name: AppRoutesConversation.chatSetting,
      page: () => ChatPersonalSettingView(),
      bindings: [
        ChatPersonalSettingBindings(),
      ],
    ),

    /// 群设置
    GetPage(
      name: AppRoutesConversation.chatGroupSetting,
      page: () => ChatGroupSettingView(),
      bindings: [
        ChatGroupSettingBindings(),
      ],
    ),

    /// 聊天频率限制
    GetPage(
      name: AppRoutesConversation.chatFrequency,
      page: () => ChatFrequencyLimitView(),
      bindings: [
        ChatFrequencyLimitBindings(),
      ],
    ),

    /// 聊天文件
    GetPage(
        name: AppRoutesConversation.chatFile,
        page: () => ChatFileView(),
        bindings: [ChatFileBindings()]),
  ];
}
