import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/database/user_manager.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';
import 'package:im_chat_common_plugin/services/global_service.dart';
import 'package:im_chat_common_plugin/tools/dialog_utils.dart';
import 'package:im_chat_common_plugin/tools/my_shared_pref.dart';
import 'package:im_chat_common_plugin/tools/tools_utils.dart';

import '../../api/api_provider_auth.dart';

class RegisterController extends GetxController {
  final ApiProviderAuth api;
  RegisterController({required this.api});

  final formKey = GlobalKey<FormBuilderState>();

  var hidePasswordTextField = true.obs;
  var hideConfirmPasswordTextField = true.obs;
  var leftCount = 0.obs;
  String phoneNum = "";
  String zoneNum = "";

  @override
  void onReady() {
    super.onReady();
  }

  void togglePasswordVisibility({bool isConfirm = false}) {
    if (isConfirm) {
      hideConfirmPasswordTextField.value = !hideConfirmPasswordTextField.value;
    } else {
      hidePasswordTextField.value = !hidePasswordTextField.value;
    }
  }

  void onPasswordChange(String value) {}

  void onConfirmPasswordChange(String value) {}

  void onSendSms() {
    if (leftCount.value > 0) return;
    leftCount.value = 60;
    _countdown();
  }

  void _countdown() {
    if (leftCount.value > 0) {
      leftCount.value--;
      Future.delayed(Duration(seconds: 1), _countdown);
    }
  }

  Future<void> doRegister() async {
    print("doRegister");
    if (formKey.currentState?.saveAndValidate() ?? false) {
      try {
        var forms = formKey.currentState?.value;
        String smsCode = forms!["smsCode"];
        String nickName = forms["nickName"];
        String password = forms["password"];
        String passwordConfirm = forms["passwordConfirm"];
        if (password != passwordConfirm) {
          DialogUtils.showError("两次密码不一致");
          return;
        }
        var res = await api.register(
          password: password,
          device: ToolsUtils.getDeviceMap(),
          phone: phoneNum,
          name: nickName,
          zone: zoneNum,
          code: smsCode,
        );
        UserInfoManager().setUserInfo(res.data!);
        final userManager = UserManager();
        await userManager.upsertUser(res.data!);
        userManager.setCurrentUserUid(res.data!.uid);
        MySharedPref.setToken(res.data!.token);
        GlobalService.to.token = res.data!.token;
        GlobalService.to.uid = res.data!.uid;
        GlobalService.to.userModel = res.data!;
        GlobalService.to.loginDefault(GlobalService.to.token).then((value){
          if (value) {
            // print("object_uid:${getModel?.uid}");
            Get.offAllNamed("/home");
            GlobalService.to.isLoggedIn.value = true;
            print("手机号:$phoneNum  验证码:$smsCode  昵称:$nickName 密码:$password  确认密码:$passwordConfirm");
          }
        });

      } catch (e) {
        DialogUtils.showError(e.toString());
      }
    } else {
      print("表单验证失败：${formKey.currentState?.errors}");
    }
  }
}
