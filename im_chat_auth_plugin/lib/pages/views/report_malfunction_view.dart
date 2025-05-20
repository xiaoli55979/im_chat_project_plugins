import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:im_chat_auth_plugin/l10n/slocal_auth.dart';
import 'package:im_chat_auth_plugin/pages/controllers/report_malfunction_controller.dart';
import 'package:im_chat_common_plugin/components/my_app_bar.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ReportMalfunctionView extends GetView<ReportMalfunctionController> {
  const ReportMalfunctionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text(SlocalAuth.getLocalizaContent(
            SlocalAuth.of(context).uploadMalfunction),style: TextStyle(fontSize: 16),),
      ),
      body: GestureDetector(
        onTap: HideKeybUtils.hideKeyShowUnfocus,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(SlocalAuth.getLocalizaContent(
                  SlocalAuth.of(context).malfunctionInfo)),
              SizedBox(
                height: 4,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2)
                ),
                height: 200,  // 设置固定高度
                child: FormBuilderTextField(
                  name: 'fault_description',
                  decoration: InputDecoration(
                    hintText: '请输入故障详情',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: EdgeInsets.all(10),  // 设置内边距
                  ),
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  maxLines: null,
                  minLines: 9,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MainButton(
                backgroundColor: Colors.blue,
                onPressed: () {
                  // if (controller.formKey.currentState?.saveAndValidate() ??
                  //     false) {
                  controller.submit(); // 如果表单验证通过，则执行注册逻辑
                  // } else {
                  //   print(
                  //       "表单验证失败：${controller.formKey.currentState?.errors}");
                  // }
                },
                text: SlocalAuth.getLocalizaContent(
                    SlocalAuth.of(context).auth_submit),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
