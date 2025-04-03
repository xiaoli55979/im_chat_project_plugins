import 'package:get/get.dart';
import 'package:im_chat_common_plugin/api/provider.dart';

class UserInfoController extends GetxController {
  UserInfoController({required this.api});
  final ApiProvider api;

  String pageName = "13445";

  String uid = "";
  @override
  void onInit() {
    super.onInit();
    pageName = "112334";
    loadInitialData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  /// 加载初始数据
  void loadInitialData() async {
    try {
      pageName = "111222";
      update();
      final arguments = Get.arguments as Map<String, dynamic>?;
      print("object_loadInitialData:${arguments.toString()}");
      if (arguments != null) {
        final uidStr = arguments["uid"] as String?;
        if (uidStr != null) {
          uid = uidStr;
          print("object_channelType:$uid");
          final response = await api.getUserInfo(uid: uid!);

          await api.getUserAvatar(uid: uid);
          // if (channelid != null && channeltype != null) {
          //   channelID = channelid;
          //   channelType = channeltype;
          //   WKIM.shared.channelManager.getChannel(channelID, channelType).then((channel) {
          //     WKIM.shared.channelManager.fetchChannelInfo(channelID, channelType);
          //     channelName = '${channel?.channelName}';
          //     update();
          //   });
        }
      }
    } catch (e) {
      print("加载初始数据失败：$e");
    }
  }
}
