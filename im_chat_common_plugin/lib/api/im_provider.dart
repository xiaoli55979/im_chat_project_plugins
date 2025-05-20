import 'package:im_chat_common_plugin/api/user_provider.dart';
import 'package:wukongimfluttersdk/entity/conversation.dart';
import 'package:wukongimfluttersdk/entity/msg.dart';

class ImProvider extends UserProvider {
  static syncConversation(String lastSsgSeqs, int msgCount, int version, Function(WKSyncConversation) back) async {
    WKSyncConversation conversation = WKSyncConversation();
    conversation.conversations = [];

    back(conversation);
  }

  static WKSyncMsg getWKSyncMsg(dynamic json) {
    WKSyncMsg msg = WKSyncMsg();
    msg.channelID = json['channel_id'];
    msg.messageID = json['message_id'].toString();
    msg.channelType = json['channel_type'];
    msg.clientMsgNO = json['client_msg_no'];
    msg.messageSeq = json['message_seq'];
    msg.fromUID = json['from_uid'];
    msg.isDeleted = json['is_deleted'];
    msg.timestamp = json['timestamp'];
    //  msg.payload = json['payload'];

    // String payload = json['payload'];
    try {
      msg.payload = json['payload'];
      // msg.payload = jsonDecode(utf8.decode(base64Decode(payload)));
    } catch (e) {
      // print('异常了');
    }
    // 解析扩展
    var extraJson = json['message_extra'];
    if (extraJson != null) {
      var extra = getMsgExtra(extraJson);
      msg.messageExtra = extra;
    }
    return msg;
  }

  static WKSyncExtraMsg getMsgExtra(dynamic extraJson) {
    var extra = WKSyncExtraMsg();
    extra.messageID = extraJson['message_id'];
    extra.messageIdStr = extraJson['message_id_str'];
    extra.revoke = extraJson['revoke'] ?? 0;
    extra.revoker = extraJson['revoker'] ?? '';
    extra.readed = extraJson['readed'] ?? 0;
    extra.readedCount = extraJson['readed_count'] ?? 0;
    extra.isMutualDeleted = extraJson['is_mutual_deleted'] ?? 0;
    return extra;
  }
}
