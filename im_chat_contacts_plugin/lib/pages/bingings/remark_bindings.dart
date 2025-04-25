import 'package:get/get.dart';
import 'package:im_chat_contacts_plugin/pages/controllers/remark_controller.dart';

class RemarkBindings extends Binding {
  @override
  List<Bind> dependencies() {
    // TODO: implement dependencies
    return [
      Bind.lazyPut(() => RemarkController())
    ];
  }
}