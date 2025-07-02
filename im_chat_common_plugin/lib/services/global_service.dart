import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart' show ByteData, Uint8List, rootBundle;
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/api/provider/user_provider.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';
import 'package:im_chat_common_plugin/manager/im_manager.dart';
import 'package:im_chat_common_plugin/models/user_info_data.dart';
import 'package:im_chat_common_plugin/models/global_info_entity.dart';
import 'package:im_chat_common_plugin/models/person_info_entity.dart';
import 'package:im_chat_common_plugin/tools/app_config_utils.dart';

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
  UserInfoData? userModel;

  final confManager = AppConfigUtils();
  PersonInfoEntity? get personConf => AppConfigUtils().personConf;
  GlobalInfoEntity? get globalConf => AppConfigUtils().globalConf;
  UserInfoData? get ownConf => AppConfigUtils().ownConf;

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
    // return GlobalService.to.isLoggedIn.value ? '/home' : '/login';
    String projectId = MySharedPref.getToken() ?? "";
    String rootPath = projectId.isEmpty ? "/login" : "/home";
    if (projectId.isNotEmpty) {
      try {
        userModel = await userManager.getCurrentUser();
        print("object_userModel:${userModel?.token}");
        if (userModel != null && userModel!.token != null && userModel!.token!.isNotEmpty == true) {
          token = userModel!.token;
          uid = userModel!.uid ?? '';

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

  /// 获取配置信息
  Future<void> getAppConfig() async {

  }
  // /// 获取APP模块
  // Future<void> getAppModule() async {
  //   try {
  //     var res = await api.appModule();
  //   } catch (_) {}
  // }

  /// 获取全局配置信息
  Future<void> getGlobalConfig() async {
    try {
      _getGlobalConf();
    } catch (_) {}
  }

  /// 获取个人配置信息
  Future<void> getPersonConfig() async {
    try {
      _getPersonConf();
    } catch (_) {}
  }

  /// 获取当前登录配置信息
  Future<void> getOwnConfig() async {
    try {
      await _getOwnConf();
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
      /// 获取全局配置
      getGlobalConfig();
      if (token?.isNotEmpty == true) {
        /// 获取个人配置
        getPersonConfig();

        /// 获取当前用户配置
        getOwnConfig();
        /// 获取用户节点
        var result = await api.getIMNode(uid: uid);
        if (result.isSuccess) {
          final imNodeData = result.responseData?.data;
          imUtils.imNode = imNodeData!;
          String ip = imUtils.imNode.wsAddr ?? '';
          ImOptionsUtils().imNode.wsAddr = ip;
          print('ip_Adder2:$ip  imUtils.imNode:${imUtils.imNode.wsAddr}');

          /// 初始化IM
          return ImManager.shared.initIM();
        } else {
          return Future.value(false);
        }
      } else {
        return Future.value(false);
      }
    } catch (e) {
      return Future.value(false);
    }
  }

  /// 获取全局配置
  _getGlobalConf() {
    api.getGlobalConf().then((onValue) async {
        final globalModel = onValue.responseData?.data;
        await AppConfigUtils().setGlobalConf(globalModel ?? GlobalInfoEntity());

        print(globalModel);
    }).catchError((onError) {

    });
  }

  /// 获取角色配置
  _getPersonConf() {
    api.getPersonConf().then((onValue) async {
        final personModel = onValue.responseData?.data;
        await AppConfigUtils().setPersonConf(personModel ?? PersonInfoEntity());
        bus.emit(EventNames.refreshUserInfo);
        print(personModel);
    }).catchError((onError) {

    });
  }

  /// 获取登录用户(自己)配置
  _getOwnConf() async {
  final res = await api.getUserConf(uid: GlobalService.to.uid).catchError((onError) {

  });
    final ownModel = res.responseData?.data;
    await AppConfigUtils().setOwnConf(ownModel ?? UserInfoData());

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
