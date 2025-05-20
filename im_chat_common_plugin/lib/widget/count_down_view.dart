//  description:  倒计时按钮
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/config/color/colors.dart';
import 'package:im_chat_common_plugin/util/fonts.dart';
import 'package:im_chat_common_plugin/widget/button/common_button.dart';

const String _defaultText = '获取验证码'; // 默认按钮文字
const String _resendText = '重新获取'; // 重新获取文字
const int _normalTime = 60; // 默认倒计时时间
const double _fontSize = 14.0; // 文字大小

class CountDownView extends StatefulWidget {
  CountDownView({
    super.key,
    required this.action,
    this.defaultText = _defaultText,
    this.resendText = _resendText,
    this.fontSize = _fontSize,
    this.enable = false,
  });

  final String defaultText;
  final String resendText;
  final double fontSize;
  bool enable;
  final void Function({VoidCallback? success, VoidCallback? failed}) action;

  @override
  State<CountDownView> createState() => _CountDownViewState();
}

class _CountDownViewState extends State<CountDownView> {

  String _changeText = _defaultText;
  Timer? _countDownTimer;
  int _countDownNum = _normalTime;
  // bool ticking = false;

  @override
  void initState() {
    super.initState();
    _changeText = widget.defaultText;
  }

  @override
  void dispose() {
    _countDownTimer?.cancel();
    _countDownTimer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      minSize: 0,
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.zero,
      onPressed: widget.enable ? _getVCode : null,
      child: CommonText.instance(_changeText, widget.fontSize, color: widget.enable ? IMColors.primaryColor : IMColors.hintTextColor),
    );
  }

  _getVCode() {
    widget.enable = false;
    widget.action(success: (){
      startCountdown();
    }, failed: (){
      setState(() {
        widget.enable = true;
      });
    });
  }

  /// 开始倒计时
  void startCountdown() {
    setState(() {
      if (_countDownTimer != null) {
        return;
      }
      // Timer的第一秒倒计时是有一点延迟的，为了立刻显示效果可以添加下一行。
      _changeText = '${_countDownNum--}s';
      _countDownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_countDownNum > 0) {
            _changeText = '${_countDownNum--}s';
          } else {
            _changeText = widget.resendText;
            _countDownNum = _normalTime;
            _countDownTimer?.cancel();
            _countDownTimer = null;
            widget.enable = true;
          }
        });
      });
    });
  }
}
