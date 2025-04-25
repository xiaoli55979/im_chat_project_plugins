import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:im_chat_contacts_plugin/pages/bingings/friend_info_bindings.dart';
import 'package:im_chat_contacts_plugin/pages/bingings/my_managed_group_bindings.dart';
import 'package:im_chat_contacts_plugin/pages/bingings/remark_bindings.dart';
import 'package:im_chat_contacts_plugin/pages/views/friend_info_view.dart';
import 'package:im_chat_contacts_plugin/pages/views/my_managed_group_view.dart';
import 'package:im_chat_contacts_plugin/pages/views/remark_view.dart';

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

    /// 我管理的群，我加入的群
    GetPage(
        name: AppRoutesContacts.myManagedGroup,
        page: () => const MyManagedGroupView(),
        bindings: [MyManagedGroupBindings()]
    ),

    /// 好友资料
    GetPage(name: AppRoutesContacts.friendInfo, page: () => const FriendInfoView(),
    bindings: [FriendInfoBindings()]
    ),

    /// 备注
    GetPage(name: AppRoutesContacts.remark, page: () => RemarkView(),
    bindings: [RemarkBindings()]
    )

  ];
}
