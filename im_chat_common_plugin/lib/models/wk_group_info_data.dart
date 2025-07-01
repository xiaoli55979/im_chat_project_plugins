import 'package:im_chat_common_plugin/models/response/base_response_entity.dart';

class WKGroupInfoData extends BaseData{
  int? allowMemberPinnedMessage;
  int? allowMemberQuitRemind;
  int? allowMembersVisible;
  int? allowRevokeMessage;
  int? allowSendMemberCard;
  int? allowShowNick;
  int? allowViewHistoryMsg;
  int? allowViewMemberInfo;
  int? autoSignIn;
  String? avatar;
  String? category;
  int? chatPwdOn;
  String? createdAt;
  int? flame;
  int? flameSecond;
  int? forbidden;
  int? forbiddenAddFriend;
  int? forbiddenExpirTime;
  String? groupNo;
  int? groupType;
  int? invite;
  int? joinGroupRemind;
  int? memberCount;
  int? mute;
  String? name;
  String? notice;
  int? onlineCount;
  int? openSignIn;
  int? publicSignIn;
  int? quit;
  int? receipt;
  String? remark;
  int? revokeRemind;
  int? role;
  int? save;
  int? screenshot;
  int? showNick;
  String? signInName;
  int? status;
  int? top;
  String? updatedAt;
  int? version;

  WKGroupInfoData(
      {allowMemberPinnedMessage,
        allowMemberQuitRemind,
        allowMembersVisible,
        allowRevokeMessage,
        allowSendMemberCard,
        allowShowNick,
        allowViewHistoryMsg,
        allowViewMemberInfo,
        autoSignIn,
        avatar,
        category,
        chatPwdOn,
        createdAt,
        flame,
        flameSecond,
        forbidden,
        forbiddenAddFriend,
        forbiddenExpirTime,
        groupNo,
        groupType,
        invite,
        joinGroupRemind,
        memberCount,
        mute,
        name,
        notice,
        onlineCount,
        openSignIn,
        publicSignIn,
        quit,
        receipt,
        remark,
        revokeRemind,
        role,
        save,
        screenshot,
        showNick,
        signInName,
        status,
        top,
        updatedAt,
        version});

  @override
  WKGroupInfoData.fromJson(dynamic json) {
    allowMemberPinnedMessage = json['allow_member_pinned_message'];
    allowMemberQuitRemind = json['allow_member_quit_remind'];
    allowMembersVisible = json['allow_members_visible'];
    allowRevokeMessage = json['allow_revoke_message'];
    allowSendMemberCard = json['allow_send_member_card'];
    allowShowNick = json['allow_show_nick'];
    allowViewHistoryMsg = json['allow_view_history_msg'];
    allowViewMemberInfo = json['allow_view_member_info'];
    autoSignIn = json['auto_sign_in'];
    avatar = json['avatar'];
    category = json['category'];
    chatPwdOn = json['chat_pwd_on'];
    createdAt = json['created_at'];
    flame = json['flame'];
    flameSecond = json['flame_second'];
    forbidden = json['forbidden'];
    forbiddenAddFriend = json['forbidden_add_friend'];
    forbiddenExpirTime = json['forbidden_expir_time'];
    groupNo = json['group_no'];
    groupType = json['group_type'];
    invite = json['invite'];
    joinGroupRemind = json['join_group_remind'];
    memberCount = json['member_count'];
    mute = json['mute'];
    name = json['name'];
    notice = json['notice'];
    onlineCount = json['online_count'];
    openSignIn = json['open_sign_in'];
    publicSignIn = json['public_sign_in'];
    quit = json['quit'];
    receipt = json['receipt'];
    remark = json['remark'];
    revokeRemind = json['revoke_remind'];
    role = json['role'];
    save = json['save'];
    screenshot = json['screenshot'];
    showNick = json['show_nick'];
    signInName = json['sign_in_name'];
    status = json['status'];
    top = json['top'];
    updatedAt = json['updated_at'];
    version = json['version'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['allow_member_pinned_message'] = allowMemberPinnedMessage;
    data['allow_member_quit_remind'] = allowMemberQuitRemind;
    data['allow_members_visible'] = allowMembersVisible;
    data['allow_revoke_message'] = allowRevokeMessage;
    data['allow_send_member_card'] = allowSendMemberCard;
    data['allow_show_nick'] = allowShowNick;
    data['allow_view_history_msg'] = allowViewHistoryMsg;
    data['allow_view_member_info'] = allowViewMemberInfo;
    data['auto_sign_in'] = autoSignIn;
    data['avatar'] = avatar;
    data['category'] = category;
    data['chat_pwd_on'] = chatPwdOn;
    data['created_at'] = createdAt;
    data['flame'] = flame;
    data['flame_second'] = flameSecond;
    data['forbidden'] = forbidden;
    data['forbidden_add_friend'] = forbiddenAddFriend;
    data['forbidden_expir_time'] = forbiddenExpirTime;
    data['group_no'] = groupNo;
    data['group_type'] = groupType;
    data['invite'] = invite;
    data['join_group_remind'] = joinGroupRemind;
    data['member_count'] = memberCount;
    data['mute'] = mute;
    data['name'] = name;
    data['notice'] = notice;
    data['online_count'] = onlineCount;
    data['open_sign_in'] = openSignIn;
    data['public_sign_in'] = publicSignIn;
    data['quit'] = quit;
    data['receipt'] = receipt;
    data['remark'] = remark;
    data['revoke_remind'] = revokeRemind;
    data['role'] = role;
    data['save'] = save;
    data['screenshot'] = screenshot;
    data['show_nick'] = showNick;
    data['sign_in_name'] = signInName;
    data['status'] = status;
    data['top'] = top;
    data['updated_at'] = updatedAt;
    data['version'] = version;
    return data;
  }
}
