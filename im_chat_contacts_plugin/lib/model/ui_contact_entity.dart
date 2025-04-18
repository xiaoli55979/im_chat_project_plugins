import 'package:im_chat_common_plugin/util/extension.dart';
import 'package:im_chat_common_plugin/widget/az_listview/az_common.dart';
import 'package:im_chat_contacts_plugin/pages/controllers/contacts_controller.dart';
import 'package:wukongimfluttersdk/entity/channel.dart';

class UiContactEntity extends ISuspensionBean {
  WKChannel? wkChannel;
  final ContactsHeader? contactsHeader;

  UiContactEntity({this.wkChannel, this.contactsHeader});

  @override
  String getSuspensionTag() {
    if (contactsHeader !=null) {
      return '↑';
    }
    return wkChannel == null ?  '☆' : wkChannel!.channelRemark.isNotEmptyString() ? wkChannel!.channelRemark.getFirstLetter() : wkChannel!.channelName.getFirstLetter();
  }

}
