import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';
import 'package:wukongimfluttersdk/entity/msg.dart';
import 'package:wukongimfluttersdk/type/const.dart';

class UIMsg {
  WKMsg wkMsg;
  UIMsg(this.wkMsg);

  String getShowContent() {
    if (wkMsg.messageContent == null) {
      return '';
    }
    return wkMsg.messageContent!.displayText();
    // return "${wkMsg.messageContent!.displayText()} [是否需要回执：${wkMsg.setting.receipt}]，[已读数量：$readCount]";
  }

  String getShowTime() {
    return ToolsUtils.formatDateTime(wkMsg.timestamp);
  }

  String getStatusIV() {
    if (wkMsg.status == WKSendMsgResult.sendLoading) {
      return 'assets/loading.png';
    } else if (wkMsg.status == WKSendMsgResult.sendSuccess) {
      return 'assets/success.png';
    }
    return 'assets/error.png';
  }
}
