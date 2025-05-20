import 'package:get/get.dart';
import 'package:im_chat_contacts_plugin/pages/controllers/report_controller.dart';

class ReportBindings extends Binding {
  @override
  List<Bind> dependencies() {
    // TODO: implement dependencies
    return [
      Bind.lazyPut(() => ReportController())
    ];
  }
}