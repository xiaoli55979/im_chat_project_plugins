import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:im_chat_contacts_plugin/pages/bingings/contacts_bindings.dart';
import 'package:im_chat_conversation_plugin/pages/bingings/conversation_bindings.dart';
import 'package:im_chat_settings_plugin/pages/bingings/my_bindings.dart';

import '../pages/bingings/home_bindings.dart';
import '../pages/views/home_view.dart';
import 'app_routes_home.dart';

class AppPagesHome {
  AppPagesHome._();

  /// 路由管理
  static final routes = [
    /// home
    GetPage(
      name: AppRoutesHome.home,
      page: () => HomeView(),
      bindings: [
        HomeBindings(),
        ContactsBindings(),
        ConversationBindings(),
        MyBindings(),
      ],
    ),
  ];
}
