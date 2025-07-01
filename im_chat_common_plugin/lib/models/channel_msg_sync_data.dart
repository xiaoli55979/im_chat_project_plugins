import 'package:im_chat_common_plugin/models/conversation_sync_data.dart';
import 'package:im_chat_common_plugin/models/response/base_response_entity.dart';

class ChannelMsgSyncData extends BaseData{
  int? endMessageSeq;
  int? more;
  int? pullMode;
  int? startMessageSeq;
  List<Recents>? messages;

  ChannelMsgSyncData(
      {endMessageSeq, more, pullMode, startMessageSeq});

  @override
  ChannelMsgSyncData.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      endMessageSeq = json['end_message_seq'];
      more = json['more'];
      pullMode = json['pull_mode'];
      startMessageSeq = json['start_message_seq'];
      if (json['messages'] != null) {
        messages = List.from(json['messages'])
            .map((e) => Recents.fromJson(e))
            .toList();
      }
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['end_message_seq'] = endMessageSeq;
    data['more'] = more;
    data['pull_mode'] = pullMode;
    data['start_message_seq'] = startMessageSeq;
    data['messages'] = messages?.map((e) => e.toJson()).toList();
    return data;
  }
}
