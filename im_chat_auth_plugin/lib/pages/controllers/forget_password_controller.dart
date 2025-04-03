import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';

class ForgetPasswordController extends GetxController {
  final ApiProvider api;

  ForgetPasswordController({required this.api});

  TimerUtil? _timerUtil;
  int leftCount = 0;
  bool hidePasswordTextField = true;
  bool hideConfirmPasswordTextField = true;
  final formKey = GlobalKey<FormBuilderState>();

  String submitPasswordFirst = ""; // 二次验证密码第一次
  String submitPasswordSecond = ""; // 二次验证密码第二次
  /// 选中了手机号或者邮箱  true手机号  false邮箱
  bool selectPhone = true;

  /// 显示/隐藏密码框
  showPassword() {
    hidePasswordTextField = !hidePasswordTextField;
    update();
  }

  /// 显示/隐藏确认密码框
  showConfirmPassword() {
    hideConfirmPasswordTextField = !hideConfirmPasswordTextField;
    update();
  }

  /// 发送验证码
  void onSendSms() {
    if (leftCount > 0) {
      return;
    }
    HideKeybUtils.hideKeyShowUnfocus();
    var phoneFields = selectPhone ? formKey.currentState?.fields["phone"] : formKey.currentState?.fields["email"];
    var ok = phoneFields?.validate(focusOnInvalid: true);
    if (ok != null && ok) {
      var phone = phoneFields!.value;
      // CaptchaUtils.show(
      //     businessTag: "Login",
      //     onSuccess: (captchaId) {
      //       selectPhone
      //           ? api.smsSendNoAuth(captchaId: captchaId, mobile: phone).then((res) {
      //               sendCodeResult();
      //             })
      //           : api.emailSendNoAuth(captchaId: captchaId, email: phone).then((res) {
      //               sendCodeResult();
      //             });
      //     });
    }
  }

  void sendCodeResult() {
    DialogUtils.toast(selectPhone ? "短信验证码发送成功" : "邮箱验证码发送成功");
    _timerUtil = TimerUtil(mTotalTime: 60000);
    _timerUtil?.setOnTimerTickCallback((tick) {
      leftCount = tick ~/ 1000;
      update();
    });
    _timerUtil?.startCountDown();
  }

  /// 切换类型
  void updateSelectType() {
    selectPhone = !selectPhone;
    formKey.currentState?.patchValue({"phone": null});
    formKey.currentState?.patchValue({"email": null});
    update();
  }

  /// 提交表单
  void onSubmit() {
    var ok = formKey.currentState?.saveAndValidate();
    if (ok != null && ok) {
      // var forms = formKey.currentState?.value;
      // DialogUtils.loading();
      // ProjectType type = ProjectUtils.projectType;

      // api
      //     .resetPassword(mobile: forms!['phone'], email: forms['email'], smsCode: forms['smsCode'], password: forms['password'])
      //     .then((res) {
      //   DialogUtils.dismissLoading();
      //   DialogUtils.toast("密码重置成功");
      //   Get.back();
      // });
    }
  }
}
