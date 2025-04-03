import 'package:get/get_navigation/src/routes/get_route.dart';

import '../pages/bingings/add_friends_bingings.dart';
import '../pages/views/add_friends_view.dart';
import 'app_routes_contacts.dart';

class AppPagesContacts {
  AppPagesContacts._();

  /// 路由管理
  static final routes = [
    /// 添加好友
    GetPage(
      name: AppRoutesContacts.addFriends,
      page: () => const AddFriendsView(),
      bindings: [AddFriendsBindings()],
    ),
  ];
}
