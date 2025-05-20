import 'package:get/get.dart';
import 'package:im_chat_auth_plugin/pages/controllers/report_malfunction_controller.dart';

class ReportMalfunctionBinding extends Binding {
  @override
  List<Bind> dependencies() {
    // TODO: implement dependencies
    return [
      Bind.lazyPut(() => ReportMalfunctionController())
    ];
  }

}