import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:im_chat_common_plugin/components/custom_qrcode_scanview.dart';
import 'package:im_chat_common_plugin/tools/snack_bar_util.dart';

import '../../api/api_provider_auth.dart';

class ServiceController extends GetxController {
  final ApiProviderAuth api;
  ServiceController({required this.api});
  final formKey = GlobalKey<FormBuilderState>();
  void toJoin() {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      try {
        var forms = formKey.currentState?.value;
        String serviceID = forms?["serviceID"];

      } catch (error) {

      }
    }
    Get.back();
  }

  Future<void> toScan() async {
    var result = await Get.to(() => const CustomQrcodeScanview());
    try {
      print("object_startScan:$result");
      ApiProviderAuth().updateBaseUrl(result as String);
    } catch (e, stackTrace) {
      SnackBarUtil.showError("提示", "无效二维码");
    }
  }
}