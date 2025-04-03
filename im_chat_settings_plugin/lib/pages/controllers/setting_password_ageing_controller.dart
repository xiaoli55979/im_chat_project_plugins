import 'package:get/get.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';

class SettingPasswordAgeingController extends GetxController {
  SettingPasswordAgeingController({required this.api});
  final ApiProvider api;
  int selectIndex = 4;

  @override
  void onReady() {
    super.onReady();
  }

  void updateSelect(int index) {
    selectIndex = index;
    update();
  }
}
