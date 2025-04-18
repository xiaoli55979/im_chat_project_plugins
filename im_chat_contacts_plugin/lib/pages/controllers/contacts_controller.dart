import 'package:get/get.dart';
import 'package:im_chat_common_plugin/core/base/controllers/base_controller.dart';
import 'package:im_chat_common_plugin/models/friend_model_entity.dart';
import 'package:im_chat_common_plugin/util/app_values.dart';
import 'package:im_chat_common_plugin/widget/az_listview/az_common.dart';
import 'package:im_chat_common_plugin/widget/status/multi_status_view.dart';
import 'package:im_chat_contacts_plugin/model/ui_contact_entity.dart';
import 'package:wukongimfluttersdk/entity/channel_member.dart';
import 'package:wukongimfluttersdk/wkim.dart';
import 'package:wukongimfluttersdk/entity/channel.dart';
import 'package:wukongimfluttersdk/type/const.dart';
import 'package:im_chat_common_plugin/util/storage.dart';
import '../../api/api_provider_contact.dart';
import 'package:im_chat_resource_plugin/generated/assets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

enum ContactsHeader {
  manageGroup,
  joinedGroup;

  @override
  String get title {
    switch (this) {
      case ContactsHeader.manageGroup:
        return '我管理的群组';
      case ContactsHeader.joinedGroup:
        return '我加入的群组';
    }
  }

  @override
  String get image {
    switch (this) {
      case ContactsHeader.manageGroup:
        return Assets.contactIconNewFriend;
      case ContactsHeader.joinedGroup:
        return Assets.contactIconGroups;
    }
  }
}

class ContactsController extends BaseController {
  ContactsController({required this.api});
  final ApiProviderContact api;

  var multiStatus = MultiStatusType.statusLoading;

  var contactList = <UiContactEntity>[];

  @override
  void handRegister() {
    ///注册IM监听
    listenerMembers();

    // 监听搜索框变化
    // ever(searchQuery, (_) => filterContacts());
  }

  @override
  void fetchData() {
    ///未同步过通讯录数据
    if (!Storage.getFriendSync()) {
      // 加载通讯录数据
      _loadContactDataFromServer();
    } else {
      _loadContactDataFromIM();
    }
  }

  void listenerMembers() {
    WKIM.shared.channelMemberManager.addOnRefreshMemberListener("contacts", (WKChannelMember member, bool status) {
      print("object_addOnRefreshMemberListener:${member.memberName}");
    });
  }

  ///从服务器获取联系人列表
  void _loadContactDataFromServer() async {
    try {
      var result = await api.friendSync();
      if (result.isSuccess) {
        final dataList = result.data ?? [];
        var channelList = dataList.map((friendModel){
          final wkChannel = WKChannel(friendModel.uid, WKChannelType.personal);
          wkChannel.channelRemark = friendModel.remark;
          wkChannel.channelName = friendModel.name;
          wkChannel.mute = friendModel.mute;
          wkChannel.top = friendModel.top;
          wkChannel.version = friendModel.version;
          wkChannel.status = friendModel.status;
          wkChannel.isDeleted = friendModel.isDeleted;
          wkChannel.updatedAt = friendModel.updatedAt;
          wkChannel.createdAt = friendModel.createdAt;
          wkChannel.receipt = friendModel.receipt;
          wkChannel.robot = friendModel.robot;
          wkChannel.category = friendModel.category;
          wkChannel.follow = 1;//指定为好友
          return wkChannel;
        }).toList();

        Storage.putFriendSync(true);

        ///将好友信息设置到sdk
        WKIM.shared.channelManager.addOrUpdateChannels(channelList);

        ///配置数据
        _configData(channelList);
      } else {
        EasyLoading.showError(result.msg ?? '未知错误，请稍后再试');
      }
    } catch (e) {
      multiStatus = MultiStatusType.statusError;
      print("object_e:${e.toString()}");
    }
  }

  ///从IM数据库获取联系人列表
  void _loadContactDataFromIM() async {
    final channelList = await WKIM.shared.channelManager.getWithFollowAndStatus(WKChannelType.personal, 1, 1);
    ///配置数据
    _configData(channelList);
  }

  ///配置数据
  void _configData(List<WKChannel> channelList){
    contactList = channelList.map((wkChannel){
      return UiContactEntity(wkChannel: wkChannel);
    }).toList();

    ///页面状态
    multiStatus = contactList.isNotEmpty ? MultiStatusType.statusContent : MultiStatusType.statusEmpty;

    ///根据首字母排序
    SuspensionUtil.sortListBySuspensionTag(contactList);
    ///是否显示首字母
    SuspensionUtil.setShowSuspensionStatus(contactList);

    ///添加默认分组
    _addDefaultContactGroups();

    update();
  }

  ///添加默认分组
  _addDefaultContactGroups(){
    final defaultGroupList = ContactsHeader.values.map((element){
      return UiContactEntity(contactsHeader: element);
    }).toList();

    contactList.insertAll(0, defaultGroupList);
  }
}
