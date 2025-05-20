import 'package:get/get.dart';
import 'package:im_chat_auth_plugin/routes/app_routes_auth.dart';

class HelpSetController extends GetxController {
void toGeneral() {
  Get.toNamed(AppRoutesAuth.general);
}
}