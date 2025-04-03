import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:im_chat_switch_plugin/tools/sync_code_generator.dart';
import 'package:restart_app/restart_app.dart';

import 'cache_manager.dart';

class HomeToolPage extends StatefulWidget {
  final Widget? externalView; // 允许外部传入的页面内容
  final Map<String, WidgetBuilder> routes; // 路由表

  const HomeToolPage({
    Key? key,
    this.routes = const <String, WidgetBuilder>{}, // 提供默认值
    required this.externalView, // 必填参数
  }) : super(key: key);

  @override
  HomeToolPageState createState() => HomeToolPageState();
}

class HomeToolPageState extends State<HomeToolPage> with WidgetsBindingObserver {
  bool needClipboard = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // 监听生命周期变化
    /// 显示顶部状态栏
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  /// 监听剪贴板
  Future<void> checkClipboard() async {
    ClipboardData? clipboardData = await Clipboard.getData('text/plain');
    String clipboardContent = clipboardData?.text ?? "";
    if (clipboardContent.isNotEmpty) {
      final syncCodeGenerator = SyncCodeGenerator();

      /// 验证同步码是否有效
      bool isValid = syncCodeGenerator.isSyncCodeValid(clipboardContent);
      if (isValid) {
        await CacheManager().setBool(syncCodeGenerator.getSwitchKey(), true);
        await Clipboard.setData(const ClipboardData(text: ''));

        /// 重启APP
        Restart.restartApp(notificationTitle: '启动App', notificationBody: '请点击这里重新打开APP');
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // 移除监听器
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      if (!needClipboard) return;
      checkClipboard();
    } else if (state == AppLifecycleState.inactive) {
      needClipboard = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: widget.routes ?? const <String, WidgetBuilder>{}, // 提供默认值以防空值
      home: widget.externalView ?? _buildSafeAreaPlaceholder(),
    );
  }

  Widget _buildSafeAreaPlaceholder() {
    return const SafeArea(
      bottom: false,
      left: false,
      right: false,
      top: false,
      child: Center(
        child: Text('No external view provided'),
      ),
    );
  }
}
