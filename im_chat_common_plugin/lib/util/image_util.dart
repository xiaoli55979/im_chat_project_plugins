import 'package:im_chat_common_plugin/tools/link_utils.dart';
import 'package:im_chat_common_plugin/tools/my_shared_pref.dart';
import 'package:im_chat_common_plugin/tools/tools_utils.dart';
import 'package:im_chat_common_plugin/util/extension.dart';
import 'package:wukongimfluttersdk/entity/channel.dart';
import 'package:wukongimfluttersdk/type/const.dart';

class ImageUtil {
  static get baseUrl => ToolsUtils.instance.isDebugModel ? LinkUtils.testBaseUrl : MySharedPref.getBaseUrl() ?? LinkUtils.prodBaseUrl;

  static String? getAvatarUrl(WKChannel channel) {
    String? url;
    if (channel.avatar.isNotEmptyString() && channel.avatar.contains("/")) {
      url = getImageUrl(channel.avatar);
    } else {
      url = getAvatarUrlFromServer(channel.channelID, channel.channelType);
    }
    return url;
  }

  static String getImageUrl(String url){
    if (url.isEmptyString() || url.startsWith("http") || url.startsWith("HTTP")) {
      return url;
    } else {
      return baseUrl + url;
    }
  }

  static String getAvatarUrlFromServer(String channelID, int channelType) {
    return channelType == WKChannelType.personal ? loadAvatarUrl(channelID) : loadGroupUrl(channelID);
  }

  static String loadAvatarUrl(String uid) {
    return baseUrl + "/users/$uid/avatar";
  }

  static String loadGroupUrl(String groupId) {
    return baseUrl + "/groups/$groupId/avatar";
  }
}