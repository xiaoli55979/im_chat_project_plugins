import 'package:common_utils/common_utils.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../api/api_provider_auth.dart';

/// 登录业务处理
class LoginController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  final passwordFocusNode = FocusNode();
  bool hidePasswordTextField = true;
  final ApiProviderAuth api;
  final loginType = ''.obs;
  TextEditingController phoneController = TextEditingController();

  /// 用户信息存入数据库
  final userManager = UserManager();
  TimerUtil? _timerUtil;
  int leftCount = 0;
  String version = "";
  String? historyLoginAccount = "";
  var selectList = [true, false]; // 按钮选中
  // var selectList = [true]; // 按钮选中
  LoginController({required this.api});

  DeviceInfo? deviceInfo;
  String userName = "";
  String password = "";
  String phoneNum = "";

  int selectedIndex = 0;

  UserInfoModelEntity? userModel;

  @override
  void onReady() {
    super.onReady();
    loadUserInfo();
    deviceInfo = ToolsUtils.instance.deviceInfo;
    // if (kDebugMode) {
    //   userName = "abc111";
    //   password = "123456";
    //   formKey.currentState?.fields['username']?.didChange(userName);
    //   formKey.currentState?.fields['password']?.didChange(password);
    // }
    update();
    loadVersion();
  }

  Future<void> loadUserInfo() async {
    userModel = await userManager.getCurrentUser();
    if (userModel?.phone != null) {
      phoneController.text = userModel!.phone; // 直接赋值
      phoneNum = userModel!.username;
    }

    update();
  }

  // 加载版本管理
  Future<void> loadVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    var manVersion = packageInfo.version;
    var build = packageInfo.buildNumber;
    var up = GlobalService.to.getVersionCode.toString();
    version = "V$manVersion-$build-$up";
    update();
  }

  /// 登录成功后界面跳转
  void redirect(String? thenTo) {
    // if (thenTo != null) {
    //   if (thenTo == Routes.home) {
    //     /// 刷新首页 --临时
    //     // 如果是首页，直接转换界面
    //     // var homeController = Get.find<HomeController>();
    //     // homeController.changeTabIndex(2);
    //     // homeController.update();
    //     Get.back();
    //
    //     /// 发送通知
    //     AuthManager().onLoginSuccess();
    //   } else {
    //     Get.offNamed(thenTo);
    //   }
    // } else {
    //   Get.offNamed(Routes.home);
    // }
  }

  /// 按钮操作监听
  void onSwitch(int index) {
    selectedIndex = index;
    formKey.currentState?.reset();
    for (int i = 0; i < selectList.length; i++) {
      selectList[i] = i == index;
    }
    update();
  }

  /// 显示/隐藏密码框
  showPassword() {
    hidePasswordTextField = !hidePasswordTextField;
    update();
  }

  void changeSegment(index) {
    selectedIndex = index;
    update();
  }

  /// 开始线路检测
  Future<void> seartCheckLine() async {
    // UnifiedReminder.showLineCheck();
  }

  /// 发送验证码
  void onSendSms() {
    if (leftCount > 0) {
      return;
    }
    HideKeybUtils.hideKeyShowUnfocus();
    var phoneFields = formKey.currentState?.fields["phone"];
    var ok = phoneFields?.validate(focusOnInvalid: true);
    if (ok != null && ok) {
      // var phone = phoneFields!.value;
      // phone = TextFieldUtils.removeSpace(phone);
      // CaptchaUtils.show(
      //     businessTag: "Login",
      //     onSuccess: (captchaId) {
      //       api.smsSendNoAuth(captchaId: captchaId, mobile: phone).then((res) {
      //         DialogUtils.toast("短信验证码发送成功");
      //         _timerUtil = TimerUtil(mTotalTime: 60000);
      //         _timerUtil?.setOnTimerTickCallback((tick) {
      //           leftCount = tick ~/ 1000;
      //           update();
      //         });
      //         _timerUtil?.startCountDown();
      //       });
      //     });
    }
  }

  /// 滑动验证完成，开始登录
  Future<void> onLogin() async {
    // print("object");
    try {
      var ok = formKey.currentState?.saveAndValidate(focusOnInvalid: false, autoScrollWhenFocusOnInvalid: false);
      // print("object_ok:$ok");
      if (ok != null && ok) {
        HideKeybUtils.hideKeyShowUnfocus();
        var forms = formKey.currentState?.value;
        // print("object_forms:$forms");
        // String username = forms!["username"];
        // String password = forms["password"];
        String smsCode = forms!["smsCode"];
        var res = await api.login(
          username: phoneNum,
          password: smsCode,
          device: ToolsUtils.getDeviceMap(),
        );
        UserInfoModelEntity model = res.data!;
        UserInfoManager().setUserInfo(model);
        await userManager.upsertUser(model);
        userManager.setCurrentUserUid(model.uid);
        GlobalService.to.token = model.token;
        GlobalService.to.uid = model.uid;
        GlobalService.to.userModel = res.data!;
        MySharedPref.setToken(model.token);
        UserInfoModelEntity? getModel = await userManager.getCurrentUser();
        GlobalService.to.loginDefault(model.token).then((value){
          if (value) {
            print("object_uid:${getModel?.uid}去到主页}");
            Get.offAllNamed("/home");

            GlobalService.to.isLoggedIn.value = true;
          }
        });
      }
    } catch (e) {
      print("object_e:${e.toString()}");
      GlobalService.to.isLoggedIn.value = false;
      if (e is ApiException) {
        DialogUtils.showSnackBar(content: e.message);
      } else {
        DialogUtils.showSnackBar(content: e.toString());
      }
    }
  }
}
