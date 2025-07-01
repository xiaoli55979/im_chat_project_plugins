import 'package:im_chat_common_plugin/models/response/base_response_entity.dart';

class ConversationSyncData extends BaseData {
  List<Conversations>? conversations;
  List<Groups>? groups;
  String? uid;
  List<Users>? users;

  ConversationSyncData({conversations, groups, uid, users});

  @override
  ConversationSyncData.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      if (json['conversations'] != null) {
        conversations = List.from(json['conversations'])
            .map((e) => Conversations.fromJson(e))
            .toList();
      }
      if (json['groups'] != null) {
        groups =
            List.from(json['groups']).map((e) => Groups.fromJson(e)).toList();
      }
      uid = json['uid'];
      if (json['users'] != null) {
        users = List.from(json['users']).map((e) => Users.fromJson(e)).toList();
      }
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['conversations'] = conversations?.map((e) => e.toJson()).toList();
    data['groups'] = groups?.map((e) => e.toJson()).toList();
    data['uid'] = uid;
    data['users'] = users?.map((e) => e.toJson()).toList();
    return data;
  }
}

class Conversations extends BaseData {
  String? channelId;
  int? channelType;
  Extra? extra;
  String? lastClientMsgNo;
  int? lastMsgSeq;
  int? mute;
  int? offsetMsgSeq;
  List<Recents>? recents;
  int? stick;
  int? timestamp;
  int? unread;
  int? version;

  Conversations(
      {channelId,
      channelType,
      extra,
      lastClientMsgNo,
      lastMsgSeq,
      mute,
      offsetMsgSeq,
      recents,
      stick,
      timestamp,
      unread,
      version});

  @override
  Conversations.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      channelId = json['channel_id'];
      channelType = json['channel_type'];
      extra = Extra.fromJson(json['extra']);
      lastClientMsgNo = json['last_client_msg_no'];
      lastMsgSeq = json['last_msg_seq'];
      mute = json['mute'];
      offsetMsgSeq = json['offset_msg_seq'];
      if (json['recents'] != null) {
        recents =
            List.from(json['recents']).map((e) => Recents.fromJson(e)).toList();
      }
      stick = json['stick'];
      timestamp = json['timestamp'];
      unread = json['unread'];
      version = json['version'];
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['channel_id'] = channelId;
    data['channel_type'] = channelType;
    data['extra'] = extra?.toJson();
    data['last_client_msg_no'] = lastClientMsgNo;
    data['last_msg_seq'] = lastMsgSeq;
    data['mute'] = mute;
    data['offset_msg_seq'] = offsetMsgSeq;
    data['recents'] = recents?.map((e) => e.toJson()).toList();
    data['stick'] = stick;
    data['timestamp'] = timestamp;
    data['unread'] = unread;
    data['version'] = version;
    return data;
  }
}

class Extra extends BaseData {
  int? browseTo;
  String? channelId;
  int? channelType;
  String? draft;
  int? keepMessageSeq;
  int? keepOffsetY;
  int? version;

  Extra(
      {browseTo,
      channelId,
      channelType,
      draft,
      keepMessageSeq,
      keepOffsetY,
      version});

  @override
  Extra.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      browseTo = json['browse_to'];
      channelId = json['channel_id'];
      channelType = json['channel_type'];
      draft = json['draft'];
      keepMessageSeq = json['keep_message_seq'];
      keepOffsetY = json['keep_offset_y'];
      version = json['version'];
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['browse_to'] = browseTo;
    data['channel_id'] = channelId;
    data['channel_type'] = channelType;
    data['draft'] = draft;
    data['keep_message_seq'] = keepMessageSeq;
    data['keep_offset_y'] = keepOffsetY;
    data['version'] = version;
    return data;
  }
}

class Recents extends BaseData {
  String? channelId;
  int? channelType;
  String? clientMsgNo;
  int? expire;
  String? fromUid;
  Header? header;
  int? isDeleted;
  MessageExtra? messageExtra;
  int? messageId;
  String? messageIdstr;
  int? messageSeq;
  String? payload;
  List<Reactions>? reactions;
  int? replyCount;
  String? replyCountSeq;
  String? replySeq;
  int? setting;
  String? signalPayload;
  String? streamNo;
  List<Streams>? streams;
  int? timestamp;
  String? toUid;
  int? voiceStatus;

  Recents(
      {channelId,
      channelType,
      clientMsgNo,
      expire,
      fromUid,
      header,
      isDeleted,
      messageExtra,
      messageId,
      messageIdstr,
      messageSeq,
      payload,
      reactions,
      replyCount,
      replyCountSeq,
      replySeq,
      setting,
      signalPayload,
      streamNo,
      streams,
      timestamp,
      toUid,
      voiceStatus});

  @override
  Recents.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      channelId = json['channel_id'];
      channelType = json['channel_type'];
      clientMsgNo = json['client_msg_no'];
      expire = json['expire'];
      fromUid = json['from_uid'];
      header = Header.fromJson(json['header']);
      isDeleted = json['is_deleted'];
      messageExtra = MessageExtra.fromJson(json['messageExtra']);
      messageId = json['message_id'];
      messageIdstr = json['message_idstr'];
      messageSeq = json['message_seq'];
      payload = json['payload'];
      if (json['reactions'] != null) {
        reactions = List.from(json['reactions'])
            .map((e) => Reactions.fromJson(e))
            .toList();
      }
      replyCount = json['reply_count'];
      replyCountSeq = json['reply_count_seq'];
      replySeq = json['reply_seq'];
      setting = json['setting'];
      signalPayload = json['signal_payload'];
      streamNo = json['stream_no'];
      if (json['streams'] != null) {
        streams =
            List.from(json['streams']).map((e) => Streams.fromJson(e)).toList();
      }
      timestamp = json['timestamp'];
      toUid = json['to_uid'];
      voiceStatus = json['voice_status'];
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['channel_id'] = channelId;
    data['channel_type'] = channelType;
    data['client_msg_no'] = clientMsgNo;
    data['expire'] = expire;
    data['from_uid'] = fromUid;
    data['header'] = header?.toJson();
    data['is_deleted'] = isDeleted;
    data['message_extra'] = messageExtra?.toJson();
    data['message_id'] = messageId;
    data['message_idstr'] = messageIdstr;
    data['message_seq'] = messageSeq;
    data['payload'] = payload;
    data['reactions'] = reactions?.map((e) => e.toJson()).toList();
    data['reply_count'] = replyCount;
    data['reply_count_seq'] = replyCountSeq;
    data['reply_seq'] = replySeq;
    data['setting'] = setting;
    data['signal_payload'] = signalPayload;
    data['stream_no'] = streamNo;
    data['streams'] = streams?.map((e) => e.toJson()).toList();
    data['timestamp'] = timestamp;
    data['to_uid'] = toUid;
    data['voice_status'] = voiceStatus;
    return data;
  }
}

class Header extends BaseData {
  int? noPersist;
  int? redDot;
  int? syncOnce;

  Header({noPersist, redDot, syncOnce});

  @override
  Header.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      noPersist = json['no_persist'];
      redDot = json['red_dot'];
      syncOnce = json['sync_once'];
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no_persist'] = noPersist;
    data['red_dot'] = redDot;
    data['sync_once'] = syncOnce;
    return data;
  }
}

class MessageExtra extends BaseData {
  List<int>? contentEdit;
  int? editedAt;
  int? extraVersion;
  int? isMutualDeleted;
  int? isPinned;
  int? messageId;
  String? messageIdStr;
  int? readed;
  int? readedAt;
  int? readedCount;
  int? revoke;
  String? revoker;
  int? voiceStatus;

  MessageExtra(
      {contentEdit,
      editedAt,
      extraVersion,
      isMutualDeleted,
      isPinned,
      messageId,
      messageIdStr,
      readed,
      readedAt,
      readedCount,
      revoke,
      revoker,
      voiceStatus});

  @override
  MessageExtra.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      contentEdit = json['content_edit'].cast<int>();
      editedAt = json['edited_at'];
      extraVersion = json['extra_version'];
      isMutualDeleted = json['is_mutual_deleted'];
      isPinned = json['is_pinned'];
      messageId = json['message_id'];
      messageIdStr = json['message_id_str'];
      readed = json['readed'];
      readedAt = json['readed_at'];
      readedCount = json['readed_count'];
      revoke = json['revoke'];
      revoker = json['revoker'];
      voiceStatus = json['voice_status'];
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content_edit'] = contentEdit;
    data['edited_at'] = editedAt;
    data['extra_version'] = extraVersion;
    data['is_mutual_deleted'] = isMutualDeleted;
    data['is_pinned'] = isPinned;
    data['message_id'] = messageId;
    data['message_id_str'] = messageIdStr;
    data['readed'] = readed;
    data['readed_at'] = readedAt;
    data['readed_count'] = readedCount;
    data['revoke'] = revoke;
    data['revoker'] = revoker;
    data['voice_status'] = voiceStatus;
    return data;
  }
}

class Reactions extends BaseData {
  String? createdAt;
  String? emoji;
  int? isDeleted;
  String? name;
  int? seq;
  String? uid;

  Reactions({createdAt, emoji, isDeleted, name, seq, uid});

  @override
  Reactions.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      createdAt = json['created_at'];
      emoji = json['emoji'];
      isDeleted = json['is_deleted'];
      name = json['name'];
      seq = json['seq'];
      uid = json['uid'];
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['created_at'] = createdAt;
    data['emoji'] = emoji;
    data['is_deleted'] = isDeleted;
    data['name'] = name;
    data['seq'] = seq;
    data['uid'] = uid;
    return data;
  }
}

class Streams extends BaseData {
  List<int>? blob;
  String? clientMsgNo;
  int? streamSeq;

  Streams({blob, clientMsgNo, streamSeq});

  @override
  Streams.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      blob = json['blob'].cast<int>();
      clientMsgNo = json['client_msg_no'];
      streamSeq = json['stream_seq'];
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['blob'] = blob;
    data['client_msg_no'] = clientMsgNo;
    data['stream_seq'] = streamSeq;
    return data;
  }
}

class Groups extends BaseData {
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

  Groups(
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
  Groups.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
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

class Users extends BaseData {
  String? avatar;
  int? beBlacklist;
  int? beDeleted;
  String? category;
  int? chatPwdOn;
  int? deviceFlag;
  String? email;
  int? flame;
  int? flameSecond;
  int? follow;
  int? isDestroy;
  int? isUploadAvatar;
  int? lastOffline;
  int? mute;
  String? name;
  int? online;
  String? phone;
  int? receipt;
  String? remark;
  int? revokeRemind;
  int? robot;
  int? screenshot;
  int? sex;
  String? shortNo;
  String? sourceDesc;
  int? status;
  int? top;
  String? uid;
  String? username;
  String? vercode;
  String? zone;

  Users(
      {avatar,
      beBlacklist,
      beDeleted,
      category,
      chatPwdOn,
      deviceFlag,
      email,
      flame,
      flameSecond,
      follow,
      isDestroy,
      isUploadAvatar,
      lastOffline,
      mute,
      name,
      online,
      phone,
      receipt,
      remark,
      revokeRemind,
      robot,
      screenshot,
      sex,
      shortNo,
      sourceDesc,
      status,
      top,
      uid,
      username,
      vercode,
      zone});

  @override
  Users.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      avatar = json['avatar'];
      beBlacklist = json['be_blacklist'];
      beDeleted = json['be_deleted'];
      category = json['category'];
      chatPwdOn = json['chat_pwd_on'];
      deviceFlag = json['device_flag'];
      email = json['email'];
      flame = json['flame'];
      flameSecond = json['flame_second'];
      follow = json['follow'];
      isDestroy = json['is_destroy'];
      isUploadAvatar = json['is_upload_avatar'];
      lastOffline = json['last_offline'];
      mute = json['mute'];
      name = json['name'];
      online = json['online'];
      phone = json['phone'];
      receipt = json['receipt'];
      remark = json['remark'];
      revokeRemind = json['revoke_remind'];
      robot = json['robot'];
      screenshot = json['screenshot'];
      sex = json['sex'];
      shortNo = json['short_no'];
      sourceDesc = json['source_desc'];
      status = json['status'];
      top = json['top'];
      uid = json['uid'];
      username = json['username'];
      vercode = json['vercode'];
      zone = json['zone'];
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['avatar'] = avatar;
    data['be_blacklist'] = beBlacklist;
    data['be_deleted'] = beDeleted;
    data['category'] = category;
    data['chat_pwd_on'] = chatPwdOn;
    data['device_flag'] = deviceFlag;
    data['email'] = email;
    data['flame'] = flame;
    data['flame_second'] = flameSecond;
    data['follow'] = follow;
    data['is_destroy'] = isDestroy;
    data['is_upload_avatar'] = isUploadAvatar;
    data['last_offline'] = lastOffline;
    data['mute'] = mute;
    data['name'] = name;
    data['online'] = online;
    data['phone'] = phone;
    data['receipt'] = receipt;
    data['remark'] = remark;
    data['revoke_remind'] = revokeRemind;
    data['robot'] = robot;
    data['screenshot'] = screenshot;
    data['sex'] = sex;
    data['short_no'] = shortNo;
    data['source_desc'] = sourceDesc;
    data['status'] = status;
    data['top'] = top;
    data['uid'] = uid;
    data['username'] = username;
    data['vercode'] = vercode;
    data['zone'] = zone;
    return data;
  }
}
