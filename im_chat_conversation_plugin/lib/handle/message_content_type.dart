import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:wukongimfluttersdk/entity/msg.dart';
import 'package:wukongimfluttersdk/type/const.dart';

class MessageContentType {
  // 1- 999 业务消息
  static const int TEXT = 1; // 文本消息
  static const int IMAGE = 2; // 图片消息
  static const int AUDIO = 4; // 语音
  static const int SMALL_VIDEO = 5; // 小视频
  static const int LOCATION = 6; // 位置消息
  static const int CARD = 7; // 名片
  static const int FILE = 8; // 文件
  static const int RED_PACKET = 9; // 红包
  static const int TRANSFER = 10; // 转账消息
  static const int MERGE_FORWARD = 11; // 合并转发
  static const int LOTTIE_STICKER = 12; // lottie 贴图
  static const int EMOJI_STICKER = 13; // emoji 贴图
  static const int RICH_TEXT = 14; // 富文本消息
  static const int TYPING = 101; // 正在输入

  // 1000-2000 系统消息
  static const int FRIEND_REQUEST = 1000; // 好友邀请请求
  static const int GROUP_MEMBER_ADD = 1002; // 添加群成员
  static const int GROUP_MEMBER_ADD_SUCCESS = 1001; // 邀请成功通知
  static const int GROUP_MEMBER_REMOVE = 1003; // 移除群成员
  static const int FRIEND_ACCEPTED = 1004; // 好友接受邀请
  static const int GROUP_UPDATE = 1005; // 群数据更新
  static const int MESSAGE_REVOKE = 1006; // 消息撤回
  static const int GROUP_MEMBER_SCAN_JOIN = 1007; // 用户扫码入群
  static const int GROUP_TRANSFER_OWNER = 1008; // 转让群主
  static const int GROUP_MEMBER_INVITE = 1009; // 邀请入群
  static const int GROUP_MEMBER_REFUSE = 1010; // 成员拒绝入群
  static const int RED_PACKET_OPEN = 1011; // 红包领取 tip
  static const int TRADE_SYSTEM_NOTIFY = 1012; // 交易系统通知
  static const int GROUP_FORBIDDEN_ADD_FRIEND = 1013; // 群内禁止互加好友
  static const int SCREENSHOT = 1014; // 截屏通知
  static const int GROUP_UPGRADE = 1022; // 群升级
  static const int TIP = 2000; // Tip 消息

  // 9900 - 9999 音视频通话消息
  static const int VIDEO_CALL_RESULT = 9989; // 音视频通话结果
  static const int VIDEO_CALL_SWITCH_TO_VIDEO = 9990; // 切换到视频
  static const int VIDEO_CALL_SWITCH_TO_VIDEO_REPLY = 9991; // 切换到视频回复
  static const int VIDEO_CALL_CANCEL = 9992; // 通话取消
  static const int VIDEO_CALL_SWITCH = 9993; // 音视频切换（未接通时）
  static const int VIDEO_CALL_DATA = 9994; // RTC 数据传输
  static const int VIDEO_CALL_MISSED = 9995; // 未接听
  static const int VIDEO_CALL_RECEIVED = 9996; // 收到通话
  static const int VIDEO_CALL_REFUSE = 9997; // 拒绝通话
  static const int VIDEO_CALL_ACCEPT = 9998; // 接受通话
  static const int VIDEO_CALL_HANGUP = 9999; // 挂断通话

  // 20000 - 30000 本地自定义消息
  static const int HISTORY_SPLIT = 20000; // 历史消息分割线
  static const int END_TO_END_ENCRYPT_HIT = 20001; // 端对端加密提示

  /// 获取消息的状态
  static types.Status getMsgStatus(WKMsg msg) {
    // 错误状态
    const errorStatuses = {
      WKSendMsgResult.sendFail,
      WKSendMsgResult.noRelation,
      WKSendMsgResult.blackList,
      WKSendMsgResult.notOnWhiteList,
    };

    // 根据消息状态判断
    if (msg.status == WKSendMsgResult.sendLoading) {
      return types.Status.sending;
    } else if (msg.status == WKSendMsgResult.sendSuccess) {
      return types.Status.sent;
    } else if (errorStatuses.contains(msg.status)) {
      return types.Status.error;
    }

    // 默认返回 sending 状态
    return types.Status.sending;
  }
}
