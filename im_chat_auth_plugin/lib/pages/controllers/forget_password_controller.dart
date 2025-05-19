import 'package:common_utils/common_utils.dart';
import 'package:dio/src/dio_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:im_chat_auth_plugin/l10n/slocal_auth.dart';
import 'package:im_chat_auth_plugin/pages/model/forget_pwd_entity.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';
import 'package:im_chat_common_plugin/util/string_ex.dart';

import '../../api/api_provider_auth.dart';

class ForgetPasswordController extends GetxController {
  final ApiProviderAuth api;

  ForgetPasswordController({required this.api});

  TimerUtil? _timerUtil;
  RxInt leftCount = 0.obs;
  bool hidePasswordTextField = true;
  bool hideConfirmPasswordTextField = true;
  final formKey = GlobalKey<FormBuilderState>();

  String submitPasswordFirst = ""; // 二次验证密码第一次
  String submitPasswordSecond = ""; // 二次验证密码第二次
  /// 选中了手机号或者邮箱  true手机号  false邮箱
  bool selectPhone = true;

  TextEditingController phoneController = TextEditingController();
  String phoneNum = "";

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
  // void onSendSms() {
  //   if (leftCount.value > 0) {
  //     return;
  //   }
  //   HideKeybUtils.hideKeyShowUnfocus();
  //   var phoneFields = selectPhone ? formKey.currentState?.fields["phone"] : formKey.currentState?.fields["email"];
  //   var ok = phoneFields?.validate(focusOnInvalid: true);
  //   if (ok != null && ok) {
  //     var phone = phoneFields!.value;
  //     // CaptchaUtils.show(
  //     //     businessTag: "Login",
  //     //     onSuccess: (captchaId) {
  //     //       selectPhone
  //     //           ? api.smsSendNoAuth(captchaId: captchaId, mobile: phone).then((res) {
  //     //               sendCodeResult();
  //     //             })
  //     //           : api.emailSendNoAuth(captchaId: captchaId, email: phone).then((res) {
  //     //               sendCodeResult();
  //     //             });
  //     //     });
  //   }
  // }

  Future<void> onSendSms() async {
    if (phoneNum.isGlobalPhoneNumber() == false) {
      print("手机号验证不通过: $phoneNum");
      DialogUtils.showError(SlocalAuth.getLocalizaContent(SlocalAuth.of(Get.context).auth_phone_hint_error));
      return;
    }
    HideKeybUtils.hideKeyShowUnfocus();
    if (leftCount.value > 0) return;
    // var res = await
    api.getVerifyCode(phone: phoneNum, zone: "86");
    print("验证码发了：");
    leftCount.value = 60;
    _countdown();
  }

  void _countdown() {
    if (leftCount.value > 0) {
      leftCount.value--;
      Future.delayed(Duration(seconds: 1), _countdown);
    }
  }

  void sendCodeResult() {
    // DialogUtils.toast(selectPhone ? "短信验证码发送成功" : "邮箱验证码发送成功");
    DialogUtils.toast(SlocalAuth.getLocalizaContent(SlocalAuth.of(Get.context).sms_code_verify_send_success));
    _timerUtil = TimerUtil(mTotalTime: 60000);
    _timerUtil?.setOnTimerTickCallback((tick) {
      leftCount.value = tick ~/ 1000;
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
    phoneNumCheck();
    var ok = formKey.currentState?.saveAndValidate();
    if (ok != null && ok) {
      var forms = formKey.currentState?.value;
      DialogUtils.loading();
      ProjectType type = ProjectUtils.projectType;

      api
          .resetPassword(phone: phoneNum.removeAllWhitespace,
          // email: forms['email'],
          code: forms?['smsCode'],
          pwd: forms?['password'], zone: '86')
          .then((res) {
            print(res);
            print("code值：${res.data!}");
        ForgetPwdEntity entity = res.data!;
        DialogUtils.dismissLoading();
        if (res.code == 0) {
          DialogUtils.toast(SlocalAuth.getLocalizaContent(SlocalAuth.of(Get.context).auth_reset_pwd_success));
          Get.back();
        } else {
          DialogUtils.toast(SlocalAuth.getLocalizaContent(SlocalAuth.of(Get.context).auth_reset_pwd_failed));
          DialogUtils.toast(res.msg ?? "");
        }
      })
          .catchError((onError) {
        print("出错了");
        DialogUtils.dismissLoading();
        if (onError is ApiException) {
          final apiException = ApiException.create(onError as DioException);
          DialogUtils.showError(apiException.message);
        } else {
          DialogUtils.showError(onError.toString());
        }
      });
    }
  }

  void phoneNumCheck() {
    if (phoneNum.removeAllWhitespace.isGlobalPhoneNumber() == false) {
      print("手机号验证不通过");
      DialogUtils.showError(SlocalAuth.getLocalizaContent(SlocalAuth.of(Get.context).auth_phone_hint_error));
      return;
    }
    print("手机号验证通过: $phoneNum");
  }
}
