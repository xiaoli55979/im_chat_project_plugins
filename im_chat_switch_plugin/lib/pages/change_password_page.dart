import 'package:flutter/material.dart';

import '../tools/password_manager.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _changePassword() async {
    String oldPassword = _oldPasswordController.text;
    String newPassword = _newPasswordController.text;
    String confirmPassword = _confirmPasswordController.text;

    // 获取当前密码
    String currentPassword = await PasswordManager.getPassword();
    if (currentPassword.isEmpty) currentPassword = "123456";

    if (oldPassword != currentPassword) {
      // 如果输入的旧密码不匹配
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Old password is incorrect'),
      ));
      return;
    }

    if (newPassword != confirmPassword) {
      // 如果新密码和确认密码不一致
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Passwords do not match'),
      ));
      return;
    }

    if (newPassword.isEmpty) {
      // 如果新密码为空
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('New password cannot be empty'),
      ));
      return;
    }

    // 保存新密码
    PasswordManager.setPassword(newPassword);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Password changed successfully'),
    ));

    Navigator.pop(context); // 返回设置页面
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _oldPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Old Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'New Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: _changePassword,
                    child: Text('Change Password'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
