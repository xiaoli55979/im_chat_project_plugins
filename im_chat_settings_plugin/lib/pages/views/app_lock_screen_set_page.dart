import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';

class AppLockScreenSetPage extends StatefulWidget {
  final VoidCallback? onPasswordSet;

  const AppLockScreenSetPage({
    Key? key,
    this.onPasswordSet,
  }) : super(key: key);

  @override
  _AppLockScreenSetPageState createState() => _AppLockScreenSetPageState();
}

class _AppLockScreenSetPageState extends State<AppLockScreenSetPage> {
  final TextEditingController _passwordController = TextEditingController();
  bool _isConfirming = false;
  bool _isPasswordVisible = false;
  String? _firstPassword;
  String _errorMessage = "";

  Future<void> _savePassword(String password) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setString("app_lock_password", password);
    await MySharedPref.setAppLockScreenPwd(password);
  }

  Future<void> _handlePasswordSubmit() async {
    String enteredPassword = _passwordController.text.trim();

    if (enteredPassword.length < 4 || enteredPassword.length > 6) {
      setState(() {
        _errorMessage = "密码必须是 4-6 位数字";
      });
      return;
    }

    if (!_isConfirming) {
      setState(() {
        _firstPassword = enteredPassword;
        _isConfirming = true;
        _errorMessage = "";
        _passwordController.clear();
      });
    } else {
      if (enteredPassword == _firstPassword) {
        await _savePassword(enteredPassword);
        widget.onPasswordSet?.call(); // 触发回调
        Get.back();
        Get.snackbar("成功", "应用锁密码已设置", snackPosition: SnackPosition.bottom);
      } else {
        setState(() {
          _errorMessage = "两次输入的密码不一致，请重新输入";
          _passwordController.clear();
          _isConfirming = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "设置应用锁",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              _isConfirming ? "请再次输入应用锁密码" : "请输入应用锁密码",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              keyboardType: TextInputType.number,
              maxLength: 6,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(6),
              ],
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: "输入 4-6 位数字密码",
                errorText: _errorMessage.isNotEmpty ? _errorMessage : null,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              onSubmitted: (_) => _handlePasswordSubmit(),
            ),
            const SizedBox(height: 20),
            MainButton(
              onPressed: _handlePasswordSubmit,
              text: "确认",
            ),
          ],
        ),
      ),
    );
  }
}
