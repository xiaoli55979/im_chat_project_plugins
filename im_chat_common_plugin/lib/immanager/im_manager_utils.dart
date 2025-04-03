import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';
import 'package:wukongimfluttersdk/common/options.dart';
import 'package:wukongimfluttersdk/type/const.dart';
import 'package:wukongimfluttersdk/wkim.dart';

import 'http_utils.dart';

class ImManagerUtils {
  static Future<bool> initIM() async {
    if (GlobalService.to.userModel == null) {
      return Future.value(false);
    }
    bool result = await WKIM.shared.setup(Options.newDefault(
      GlobalService.to.userModel!.uid,
      GlobalService.to.userModel!.token,
    ));
    WKIM.shared.options.useWebSocket = true;
    WKIM.shared.options.getAddr = (Function(String address) complete) async {
      String ip = ImOptionsUtils().imNode.wssAddr;
      print('ip_Adder:$ip');
      complete(ip);
    };
    if (result) {
      print('ip_Adder:initListener');
      WKIM.shared.connectionManager.connect();
      initListener();
    }
    // 注册自定义消息
    // WKIM.shared.messageManager.registerMsgContent(56, (data) => OrderMsg().decodeJson(data));
    return result;
  }

  // 监听sdk事件
  // 以下事件必须得实现
  static initListener() {
    // 监听同步消息扩展
    WKIM.shared.cmdManager.addOnCmdListener('sys_im', (wkcmd) async {
      print("object_sys_im:${wkcmd.cmd}");
      if (wkcmd.cmd == 'messageRevoke') {
        var channelID = wkcmd.param['channel_id'];
        var channelType = wkcmd.param['channel_type'];
        if (channelID != '') {
          // 同步消息扩展
          // var maxVersion = await WKIM.shared.messageManager.getMaxExtraVersionWithChannel(channelID, channelType);
          // HttpUtils.syncMsgExtra(channelID, channelType, maxVersion);
        }
      } else if (wkcmd.cmd == 'channelUpdate') {
        var channelID = wkcmd.param['channel_id'];
        var channelType = wkcmd.param['channel_type'];
        if (channelID != '') {
          if (channelType == WKChannelType.personal) {
            // 同步个人信息
            HttpUtils.getUserInfo(channelID);
          } else if (channelType == WKChannelType.group) {
            // 同步群信息
            HttpUtils.getGroupInfo(channelID);
          }
        }
      } else if (wkcmd.cmd == 'unreadClear') {
        print('清空红点的cmd');
        // 未读消息清除
        var channelID = wkcmd.param['channel_id'];
        var channelType = wkcmd.param['channel_type'];
        var unread = wkcmd.param['unread'];
        if (channelID != '') {
          WKIM.shared.conversationManager.updateRedDot(channelID, channelType, unread);
        }
      } else if (wkcmd.cmd == "groupAvatarUpdate") {
        HttpUtils.getGroupInfo(wkcmd.param["group_no"]);
      } else if (wkcmd.cmd == "userAvatarUpdate") {
        HttpUtils.getUserInfo(wkcmd.param["uid"]);
      }
    });
    // 监听同步某个频道的消息
    WKIM.shared.messageManager.addOnSyncChannelMsgListener((channelID, channelType, startMessageSeq, endMessageSeq, limit, pullMode, back) {
      HttpUtils.syncChannelMsg(channelID, channelType, startMessageSeq, endMessageSeq, limit, pullMode, (p0) => back(p0));

      print("object_addOnSyncChannelMsgListener:$channelID");
    });
    // 监听获取channel资料（群/个人信息）
    WKIM.shared.channelManager.addOnGetChannelListener((channelId, channelType, back) {
      print("object_addOnGetChannelListener:$channelId");
      if (channelType == WKChannelType.personal) {
        // 获取个人资料
        print('获取个人资料$channelId');
        HttpUtils.getUserInfo(channelId);
      } else if (channelType == WKChannelType.group) {
        print('获取群组资料:$channelId');
        // 获取群资料
        HttpUtils.getGroupInfo(channelId);
      }
    });
    // 监听同步最近会话
    WKIM.shared.conversationManager.addOnSyncConversationListener((lastSsgSeqs, msgCount, version, back) {
      print("addOnSyncConversationListener");
      HttpUtils.syncConversation(lastSsgSeqs, msgCount, version, back);
    });
    // 监听上传消息附件
    WKIM.shared.messageManager.addOnUploadAttachmentListener((wkMsg, back) {
      if (wkMsg.contentType == WkMessageContentType.image) {
        // // todo 上传附件
        // WKImageContent imageContent = wkMsg.messageContent! as WKImageContent;
        // imageContent.url = 'xxxxxx';
        // wkMsg.messageContent = imageContent;
        back(true, wkMsg);
      }
      if (wkMsg.contentType == WkMessageContentType.voice) {
        // todo 上传语音
        // WKVoiceContent voiceContent = wkMsg.messageContent! as WKVoiceContent;
        // voiceContent.url = 'xxxxxx';
        // wkMsg.messageContent = voiceContent;
        back(true, wkMsg);
      } else if (wkMsg.contentType == WkMessageContentType.video) {
        // WKVideoContent videoContent = wkMsg.messageContent! as WKVideoContent;
        // // todo 上传封面及视频
        // videoContent.cover = 'xxxxxx';
        // videoContent.url = 'ssssss';
        // wkMsg.messageContent = videoContent;
        back(true, wkMsg);
      }
    });
  }
}
