import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:wukongimfluttersdk/entity/channel.dart';
import 'package:wukongimfluttersdk/entity/msg.dart';

import 'message_type_handle.dart';

class MessageHandleManager {
  static List<types.Message> transferMessage(List<WKMsg> list) {
    try {
      List<types.Message> messages = [];
      for (int i = 0, size = list.length; i < size; i++) {
        WKMsg msg = list[i];
        messages.add(MessageTypeHandle.transferMessage(msg));
      }
      return messages;
    } catch (e) {
      print("object_e:${e.toString()}");
      return [];
    }
  }

  static void updateMessage(List<types.Message> listOld, WKChannel newChannel) {
    for (var message in listOld) {
      final metadata = message.metadata;
      if (metadata != null) {
        final wkMsg = metadata["wkMsg"];
        if (wkMsg is WKMsg && wkMsg.channelID == newChannel.channelID) {
          wkMsg.setFrom(newChannel);
        }
      }
    }
  }
}
