import 'dart:async';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:im_chat_common_plugin/tools/link_utils.dart';
import 'package:line_detection_plugin/line_detection.dart';

import '../../jtp_common_init.dart';
import '../../services/global_service.dart';
import '../../tools/font_utils.dart';
import '../../tools/image_tools.dart';
import '../../tools/my_shared_pref.dart';
import '../../tools/tools_utils.dart';
import '../widget/easy_splash_screen.dart';

class SplashScreenView extends StatefulWidget {
  SplashScreenView({Key? key}) : super(key: key);

  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  String lineStatus = "数据加载中";
  final _completer = Completer<String>();

  ///线路检测状态 0:加载中  1:网络异常 2:成功
  int lineTest = 0;

  /// 线路列表
  List<LinkInfo> listPath = [];

  /// 回到初始化完成
  final jtpInit = JtpComponentsInit();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// 成功进入系统
  void _onSuccess() async {
    // String path = GlobalService.to.isLoggedIn.value ? '/home' : '/login';
    // ToolsUtils.instance.loadSuccess = true;
    // _completer.complete(path);
    if (_completer.isCompleted) return;
    try {
      String pwd = MySharedPref.getAppLockScreenPwd();
      if (pwd.isNotEmpty) {
        ToolsUtils.showLockScreen();
      }
      // int loadErrorCount = MySharedPref.getLoadStatus();
      // if (loadErrorCount > 0) {
      //   String? baeUrl = MySharedPref.getBaseUrl();
      //   String msg = "成功进入系统,失败(${loadErrorCount + 1})次,avable:${LinkUtils.endpoints.length} baseUrl:$baeUrl";
      //   await MySharedPref.setLoadStatus(0);
      //   LoggerUtils.error(Exception(msg), error: "APP启动成功", scopeCallback: (Scope scope) {
      //     scope.setTag(LogType.RELOGIN.label, msg);
      //   }, level: LogLevel.ERROR, type: LogType.RELOGIN);
      // }
      //
      // /// 获取秘钥
      // await ToolsUtils.prKey;
      //
      // /// 获取配置开关
      // await ApiProvider.onLoadAppConfig();
      //
      // /// 开始获取App配置信息
      // await ApiProvider.onLoadAppMessages();


      /// 获取配置
      await GlobalService.to.getAppConfig();

      /// 尝试登录
      String path = await GlobalService.to.checkLogin();
      // String path = GlobalService.to.isLoggedIn.value ? '/home' : '/login';
      // ToolsUtils.instance.loadSuccess = true;
      _completer.complete(path);
    } catch (e) {
      setState(() {
        lineStatus = e.toString();
        lineTest = 3;
      });
    }
  }

  /// 线路检查失败
  Future<void> _onError() async {}

  /// 网络状态变化监听
  _onNetworkChange() {
    SmartDialog.dismiss();
    _onSuccess();
    // if (NetworkManager.instance.networkStatus != 2) {
    //   if (mounted) {
    //     setState(() {
    //       lineStatus = "等待网络连接";
    //     });
    //   }
    //
    // } else {
    //   if (mounted) {
    //     setState(() {
    //       lineStatus = "网络正常,开始线路检测,请稍候";
    //     });
    //   }
    //
    //
    //   /// 启动检测
    //   LineChecker(onComplete: (isSuccess) async {
    //     /// 完成后移除监听
    //     NetworkManager.instance.removeListener(_onNetworkChange);
    //     if (isSuccess) {
    //       _onSuccess();
    //     } else {
    //       _onError();
    //     }
    //   }, onCheck: (info) {
    //     if (!mounted) return;
    //     setState(() {
    //       listPath.add(info);
    //     });
    //   }, onStep: (status, msg) {
    //     if (!mounted) return;
    //     setState(() {
    //       lineTest = status;
    //       lineStatus = msg;
    //     });
    //   }).start();
    // }
  }

  /// APP入口
  Future<String> onBootstrap() async {
    /// 获取设备信息
    DeviceInfo deviceInfo = await getDeviceInfo();
    ToolsUtils.instance.setDeviceInfo(deviceInfo);
    // _onSuccess();
    /// 监听网络状态
    NetworkManager.instance.addListener(_onNetworkChange);
    return _completer.future;
  }

  /// 显示线路检测视图
  void showLineTest() {}

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      listPath: listPath,
      netStatus: lineTest,
      logo: ImageTools.assetImage(
        ImageTools.imagePath("logo.png"),
        fit: BoxFit.contain,
      ),
      showLoader: true,
      loadingText: Text(
        lineStatus,
        style: TextStyle(
          fontSize: FontUtils.desFontSize,
        ),
      ),
      futureNavigator: onBootstrap,
      loaderColor: Colors.black45,
      onRetry: (bool status) async {
        setState(() {
          listPath = [];
          lineTest = 0;
        });
        // showLineTest();
      },
      onTestStatus: (bool success) {},
    );
  }
}
