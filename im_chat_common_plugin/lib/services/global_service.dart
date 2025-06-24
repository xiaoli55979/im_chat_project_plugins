import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart' show ByteData, Uint8List, rootBundle;
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/api/provider/user_provider.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';
import 'package:im_chat_common_plugin/manager/im_manager.dart';

/// 全局认证服务
class GlobalService extends GetxService {
  // static GlobalService get to => Get.find();
  static GlobalService get to {
    try {
      return Get.find<GlobalService>();
    } catch (e) {
      return Get.put(GlobalService(api: UserProvider()));
    }
  }

  final UserProvider api;

  /// APP升级版 本
  int versionCode = 190;

  GlobalService({required this.api});

  late final RxString orderStatusNotice = "".obs;

  /// login status
  final isLoggedIn = false.obs;

  final userManager = UserManager();
  UserInfoModelEntity? userModel;

  /// device id
  String deviceId = "";

  String uid = "";

  // /// member info
  // MemberEntity? member;
  //
  // ///账户信息
  // PayAccountEntity? accountEntity;

  /// IM数据管理
  var imUtils = ImOptionsUtils();

  /// 是否是码商角色
  bool isProvider = false;

  int get getVersionCode {
    // 返回版本号
    return versionCode; // 例子中的版本号
  }

  /// Token
  String? token = MySharedPref.getToken();
  // final _player = AudioPlayer();
  // final _voice = {
  //   "NewBuyOrderNotification": "neworder",
  //   "BuyerPaidNotification": "seller_buyorder_payed",
  //   "SellerTransferNotification": "buyer_buyorder_complete",
  //   "SellerCreateAppealOrderNotification": "buyer_apper_notification"
  // };

  /// 是否已登录
  bool get isLoggedInValue => isLoggedIn.value;

  /// 是否已实名
  // bool get isVerify => member?.realStatus == 1;

  Future<bool> assetExists(String path) async {
    try {
      await rootBundle.load(path);
      return true; // 文件存在
    } catch (e) {
      return false; // 文件不存在
    }
  }

  // /// 语音播放
  // Future<void> play(String name) async {
  //   // 推送声音
  //   if (!MySharedPref.getNoticeStatus()) return;
  //   // _playAudio("$name.mp3");
  //   ResourceTools.playAudio("$name.mp3", player: _player);
  //
  // }

  @override
  void onInit() {
    super.onInit();

    /// 初始化变量
    orderStatusNotice.value = "";
  }

  @override
  void onReady() async {
    super.onReady();

    deviceId = await getDeviceID();
  }

  Future<String> getDeviceID() async {
    String tempDeviceId = "";

    /// 设备ID获取
    var deviceInfo = ToolsUtils.instance.deviceInfo;
    if (deviceInfo != null) {
      tempDeviceId = deviceInfo.deviceId;
    } else {
      deviceInfo = await getDeviceInfo();
      tempDeviceId = deviceInfo.deviceId;
    }
    return tempDeviceId;
  }

  /// 判断登录
  Future<String> checkLogin() async {
    String projectId = MySharedPref.getProjectIdKey();
    String rootPath = projectId.isNotEmpty ? "/login" : "/launch";
    if (projectId.isNotEmpty) {
      try {
        userModel = await userManager.getCurrentUser();
        print("object_userModel:${userModel?.token}");

        if (userModel?.token.isNotEmpty ?? false) {
          token = userModel!.token;
          uid = userModel!.uid;

          /// 登录后执行初始化
          bool result = await loginDefault(userModel!.token);
          rootPath = result ? "/home" : "/login";
          isLoggedIn.value = result;
        } else {
          rootPath = "/login";
          isLoggedIn.value = false;
        }
      } catch (e) {
        print("checkLogin 发生错误: $e");
        SmartDialog.dismiss(status: SmartStatus.loading);
      }
    }

    print("rootPath:$rootPath");
    return rootPath;
  }

  /// 保存登录信息
  void saveLoginInfo() {}

  /// 获取APP模块
  Future<void> getAppModule() async {
    try {
      var res = await api.appModule();
    } catch (_) {}
  }

  /// 获取配置信息
  Future<void> getAppConfig() async {
    try {
      // var res = await api.appConfig();
    } catch (_) {}
  }

  /// 登录系统（用户名密码）
  Future<void> login(String username, String password, String captchaId) async {
    // deviceId = ToolsUtils.instance.deviceID;
    //
    // /// 获取token
    // String raspass = "";
    // ProjectType type = ProjectUtils.projectType;
    // if (type == ProjectType.lianfu) {
    //   raspass = password;
    // } else {
    //   raspass = EncryptionUtil.rsaEncryption(password);
    // }
    // var res = await api.login(username: username, password: raspass, captchaId: captchaId, deviceId: deviceId ?? "");
    //
    // token = res.data["access_token"];
    // if (token != null) {
    //   await registLoginToken(token!);
    // }
  }

  Future<void> registLoginToken(String token) async {
    // MySharedPref.setToken(token);
    // await loginDefault(token);
  }

  /// 短信验证码登录
  Future<void> smsLogin(String mobile, String smsCode) async {
    // deviceId = ToolsUtils.instance.deviceID;
    // var res = await api.smsLogin(mobile: mobile, smsCode: smsCode, deviceId: deviceId ?? "");
    // token = res.data["access_token"];
    // await loginDefault(token);
  }

  /// 登录成功后首次调用接口
  Future<bool> loginDefault(String? token) async {
    try {
      if (token?.isNotEmpty == true) {
        /// 获取用户节点
        var res = await api.usersIm(uid: uid);
        imUtils.imNode = res.data!;
        String ip = imUtils.imNode.wsAddr;
        ImOptionsUtils().imNode.wsAddr = ip;
        print('ip_Adder2:$ip  imUtils.imNode:${imUtils.imNode.wsAddr}');
        // /// 获取APP模块信息
        // appConfigModel = await api.appModule();
        // await api.appModule();

        /// 初始化IM


        // /// 同步违禁词
        // await api.sensitiveWords();
        //
        // /// 同步敏感词
        // await api.prohibitWords();

        return ImManager.shared.initIM();
      } else {
        return Future.value(false);
      }
    } catch (e) {
      return Future.value(false);
    }
  }
}

/// clear token
void clear() {
  // token = null;
  // isProvider = false;
  // isLoggedIn.value = false;
  // MySharedPref.removeToken();
  // ToolsUtils.instance.loginMsg = "";
  // ToolsUtils.instance.loadSuccess = false;
}

/// 登出系统
void logout() async {
  // await api.logout();

  clear();
  // _jPush.stopPush();
  // _jPush.deleteAlias();
  // Get.deleteAll(force: true);
  // Phoenix.rebirth(Get.context!);
  // Get.reset();
  // if (ToolsUtils.instance.isJtp) {
  //   Get.offAllNamed(Routes.login);
  // } else {
  //   Get.offAllNamed(Routes.loginLianfu);
  // }
  // }
}

// 导航服务类
class NavigationService {
  static final NavigationService _instance = NavigationService._internal();

  factory NavigationService() {
    return _instance;
  }

  NavigationService._internal();

  Future<dynamic>? navigateToAndRemoveUntil(String newRouteName) {
    return Get.offNamedUntil(newRouteName, (route) => false);
  }
}
