import 'package:get/get.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';

class ChatFrequencyLimitController extends GetxController {
  ChatFrequencyLimitController({required this.api});
  final ApiProvider api;
  var selectedLimit = 0.obs; // 默认不限制
  var limits = [0, 10, 5]; // 0：不限制，10：每分钟10条，5：每分钟5条

  @override
  void onReady() {
    super.onReady();
  }

  void setLimit(int value) {
    selectedLimit.value = value;
  }
}
