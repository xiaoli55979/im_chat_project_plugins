import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:im_chat_auth_plugin/l10n/slocal_auth.dart';
import 'package:im_chat_auth_plugin/pages/controllers/service_controller.dart';
import 'package:im_chat_common_plugin/components/my_app_bar.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ServiceView extends GetView<ServiceController> {
  const ServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text("服务器"),
      ),
      body: GestureDetector(
        onTap: HideKeybUtils.hideKeyShowfocus,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FormBuilder(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                Text(SlocalAuth.getLocalizaContent(SlocalAuth.of(context).service), style: TextStyle(fontSize: FontUtils.contentTitleFontSize)),
                SizedBox(height: 6,),
                // Obx(() =>
                    FormBuilderTextField(
                  name: "serviceID",
                  // obscureText: obscureText.value,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    hintText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).service_hint),
                    // suffixIcon: IconButton(
                    //   onPressed: onToggleVisibility,
                    //   icon: Icon(obscureText.value
                    //       ? CupertinoIcons.eye_slash
                    //       : CupertinoIcons.eye),
                    // ),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: SlocalAuth.getLocalizaContent(
                            SlocalAuth.of(context).service_hint)),
                    FormBuilderValidators.match(
                      r'^[a-zA-Z0-9]+$',
                      errorText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).passwordFormatTips),
                    ),
                  ]),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9A-Za-z]")),
                    LengthLimitingTextInputFormatter(20),
                  ],
                  onChanged: (text) {

                  },
                // )
                ),
                SizedBox(height: 20,),
                MainButton(
                  backgroundColor: Colors.blue,
                  onPressed: () {
                    // if (controller.formKey.currentState?.saveAndValidate() ??
                    //     false) {
                    controller.toJoin(); // 如果表单验证通过，则执行注册逻辑
                    // } else {
                    //   print(
                    //       "表单验证失败：${controller.formKey.currentState?.errors}");
                    // }
                  },
                  text: SlocalAuth.getLocalizaContent(
                      SlocalAuth.of(context).join),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: () {
                    controller.toScan();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.qr_code_scanner, color: Colors.blue,),
                      SizedBox(width: 6,),
                      Text(SlocalAuth.getLocalizaContent(SlocalAuth.of(context).scanQRCodeToJoin),
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
