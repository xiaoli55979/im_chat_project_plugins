import 'package:flutter/material.dart';

import '../l10n/slocal_switch_kit.dart';
import '../tools/password_manager.dart';
import '../tools/switch_config.dart';
import '../tools/time_zone_util.dart';

class WelcomePage extends StatefulWidget {
  final Widget? homePage;
  final String appName;
  final SwitchConfig config;
  final ValueChanged<String>? onConfirm;

  const WelcomePage({
    super.key,
     this.homePage,
    required this.appName,
    this.config = const SwitchConfig(),
    this.onConfirm,
  });

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final TextEditingController _passwordController = TextEditingController();
  String? savedPassword; // 用于存储加载的密码，null 表示未设置密码
  bool timeZoneStatus = false; // 时区验证

  @override
  void initState() {
    super.initState();
    _loadPassword();
    timeZoneStatus = TimeZoneUtil.supportTimeZone(appStoreBuild: true, timeZone: widget.config.timeZone);
  }

  /// 从缓存加载保存的密码
  Future<void> _loadPassword() async {
    final password = await PasswordManager.getPassword();
    setState(() {
      savedPassword = password.isEmpty ? null : password; // 如果未设置密码，设为 null
    });
  }

  /// 验证密码逻辑
  void _validatePassword() {
    final enteredPassword = _passwordController.text.trim();

    if (widget.onConfirm != null) {
      widget.onConfirm!(enteredPassword);
    }

    /// 时区满足回调验证
    if (!timeZoneStatus) {
      // 如果未设置密码，使用默认密码123456验证
      if (savedPassword == null && enteredPassword == "123456") {
        _onSuccess();
      }
      // 如果已设置密码，验证用户输入是否匹配
      else if (enteredPassword == savedPassword) {
        _onSuccess();
      }
      // 验证失败的情况
      else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Incorrect password. Please try again.')),
        );
      }
    }
  }

  /// 成功时调用的方法
  void _onSuccess() {
    _navigateToHomePage(); // 导航到 HomePage
  }

  /// 导航到 HomePage 并销毁历史页面
  Future<void> _navigateToHomePage() async {
    if (widget.homePage != null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => widget.homePage!), // 使用从外部传入的 HomePage
            (Route<dynamic> route) => false, // 移除所有页面
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [widget.config.color, widget.config.color.withValues(alpha: 0.2)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              Center(
                child: Text(
                  '${SlocalSwitchKit.getLocalizaContent(SlocalSwitchKit.of(context).welcome)}${widget.appName}',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              const SizedBox(height: 50), // 间距
              Text(
                SlocalSwitchKit.getLocalizaContent(SlocalSwitchKit.of(context).inputPassword),
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                keyboardType: TextInputType.number,
                obscureText: !timeZoneStatus, // 隐藏输入内容
                decoration: InputDecoration(
                  hintText: "${SlocalSwitchKit.getLocalizaContent(SlocalSwitchKit.of(context).inputPasswordHit)}",
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.green, width: 1.5),
                  ),
                ),
              ),
              SizedBox(height: 8),
              if (!timeZoneStatus)
                Text(
                  '${SlocalSwitchKit.getLocalizaContent(SlocalSwitchKit.of(context).defaultPassword)} 123456',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: _validatePassword,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // 按钮背景色
                    padding: const EdgeInsets.symmetric(horizontal: 132, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    SlocalSwitchKit.getLocalizaContent(SlocalSwitchKit.of(context).confirm),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
}
