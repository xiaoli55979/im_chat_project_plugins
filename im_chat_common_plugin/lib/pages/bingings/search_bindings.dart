import 'package:get/get.dart';
import 'package:im_chat_common_plugin/pages/controllers/search_bar_controller.dart';


class SearchBindings extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => SearchBarController(api: Get.find())),
    ];
  }
}
