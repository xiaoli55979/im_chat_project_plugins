import 'dart:io';

import 'package:get/get.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';
import 'package:im_chat_common_plugin/models/response/result.dart' as HttpResult;
import 'package:wukongimfluttersdk/common/options.dart';
import 'package:wukongimfluttersdk/model/wk_file_content.dart';
import 'package:wukongimfluttersdk/model/wk_image_content.dart';
import 'package:wukongimfluttersdk/model/wk_media_message_content.dart';
import 'package:wukongimfluttersdk/model/wk_voice_content.dart';
import 'package:wukongimfluttersdk/type/const.dart';
import 'package:wukongimfluttersdk/wkim.dart';

import '../models/conversation_cmd_msg_entity.dart';
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
      String ip = ImOptionsUtils().imNode.wsAddr;
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
          var maxVersion = await WKIM.shared.messageManager.getMaxExtraVersionWithChannel(channelID, channelType);
          HttpUtils.syncMsgExtra(channelID, channelType, maxVersion);
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
      // else if (wkcmd.cmd == 'friendRequest') {
      //   final msg = ConversationCmdMsgEntity();
      //   msg.cmdType = wkcmd.cmd;
      //   print(wkcmd.param['messageTime']);
      //   msg.applyName = wkcmd.param['apply_name'];
      //   msg.applyUid = wkcmd.param['apply_uid'];
      //   msg.remark = wkcmd.param['remark'];
      //   msg.toUid = wkcmd.param["to_uid"];
      //   msg.token = wkcmd.param['token'];
      //   msg.channelId = wkcmd.param['channel_id'];
      //   msg.channelType = wkcmd.param['channel_type'];
      //   int? count = await CmdMsgDBHelper.instance.getRedCount(msg.toUid, msg.cmdType);
      //   msg.redCount += (count ?? 0);
      //   msg.content = wkcmd.param['content'];
      //   msg.timeStamp = wkcmd.param['timeStamp'];
      //   msg.id += 1;
      //   print("cmduid${msg.toUid}");
      //
      //   CmdMsgDBHelper.instance.updateOrInsertByCmdTypeAndToUid(msg);
      // }
    });
    // 监听同步某个频道的消息
    WKIM.shared.messageManager.addOnSyncChannelMsgListener((channelID, channelType, startMessageSeq, endMessageSeq, limit, pullMode, back) {
      HttpUtils.syncChannelMsg(channelID, channelType, startMessageSeq, endMessageSeq, limit, pullMode, (p0) => back(p0));

      print("object_addOnSyncChannelMsgListener:${(back)=>back(back)}");
    });
    // WKIM.shared.reminderManager.addOnNewReminderListener("sys_reminder", (msgs) {
    //   print("xitongxiaoxi: $msgs");
    // });
    // 监听获取channel资料（群/个人信息）
    WKIM.shared.channelManager.addOnGetChannelListener((channelId, channelType, back) {
      print("object_addOnGetChannelListener:$channelId");
      if (channelType == WKChannelType.personal) {
        // 获取个人资料
        print('获取个人资料$channelId');
        // HttpUtils.getUserInfo(channelId);
      } else if (channelType == WKChannelType.group) {
        print('获取群组资料:$channelId');
        // 获取群资料
        // HttpUtils.getGroupInfo(channelId);
      }
    });
    // 监听同步最近会话
    WKIM.shared.conversationManager.addOnSyncConversationListener((lastSsgSeqs, msgCount, version, back) {//lastSsgSeqs最后一条消息序号
      print("addOnSyncConversationListener");
      HttpUtils.syncConversation(lastSsgSeqs, msgCount, version, back);
    });
    // 监听上传消息附件
    WKIM.shared.messageManager.addOnUploadAttachmentListener((wkMsg, back) async {
      if (wkMsg.contentType == WkMessageContentType.image) {
        final wkImageContent = wkMsg.messageContent as WKImageContent;
        final uploadResult = await _uploadFile(wkImageContent.localPath);
        if (uploadResult.isSuccess) {
          final url = uploadResult.responseData;
          if (url != null) {
            wkImageContent.url = url;
            wkMsg.messageContent = wkImageContent;
            back(true, wkMsg);
          }
        } else {
          back(false, wkMsg);
        }
      }
      if (wkMsg.contentType == WkMessageContentType.file) {
        final wkFileContent = wkMsg.messageContent as WKFileContent;
        final uploadResult = await _uploadFile(wkFileContent.localPath);
        if (uploadResult.isSuccess) {
          final url = uploadResult.responseData;
          if (url != null) {
            wkFileContent.url = url;
            wkMsg.messageContent = wkFileContent;
            back(true, wkMsg);
          }
        } else {
          back(false, wkMsg);
        }
      }
      if (wkMsg.contentType == WkMessageContentType.voice) {
        final wkVoiceContent = wkMsg.messageContent as WKVoiceContent;
        final uploadResult = await _uploadFile(wkVoiceContent.localPath);
        if (uploadResult.isSuccess) {
          final url = uploadResult.responseData;
          if (url != null) {
            wkVoiceContent.url = url;
            wkMsg.messageContent = wkVoiceContent;
            back(true, wkMsg);
          }
        } else {
          back(false, wkMsg);
        }
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

  static UserProvider get _userProvider => Get.find<UserProvider>();

  /// 上传文件
  static Future<HttpResult.Result<String?, Error>> _uploadFile(String path) async {
    var objectKey = TextFieldUtils.objectKeyNew(path, headPath: ImageCategory.none);
    if (objectKey.startsWith("/")) {
      objectKey = objectKey.substring(1);
    }
    return _userProvider.uploadFileNew(File(path), key: objectKey, onSendProgress: (count, total) {
    }).then((_) {
      return HttpResult.Result.succss('${LinkUtils.getFileBaseUrl}$objectKey');
    }).catchError((e, stackTrace) {
      return HttpResult.Result.failure((e is Error) ? e : Error());
    });
  }
}
