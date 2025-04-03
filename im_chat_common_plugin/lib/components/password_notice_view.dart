import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:im_chat_common_plugin/components/password_check_view.dart';

class PasswordNoticeView extends StatefulWidget {
  final String firstPassword;
  final String secondPassword;

  const PasswordNoticeView({
    super.key,
    required this.firstPassword,
    required this.secondPassword,
  });

  @override
  _PasswordNoticeViewState createState() => _PasswordNoticeViewState();
}

class _PasswordNoticeViewState extends State<PasswordNoticeView> {
  bool leastEightChar = false;
  bool mustNumberAndChar = false;
  bool leastThreeChae = false;
  bool twicePassword = false;

  /// 数字和字母
  bool hasDigitAndLetter(String str) {
    final RegExp regex = RegExp(r'(?=.*[0-9])(?=.*[a-zA-Z]).*');
    return regex.hasMatch(str);
  }

  /// 至少三个不同的字符
  bool hasThreeDifrentChar(String input) {
    Set<String> uniqueChars = Set();
    for (int i = 0; i < input.length; i++) {
      uniqueChars.add(input[i]);
      if (uniqueChars.length >= 3) {
        return true;
      }
    }
    return false;
  }

  @override
  void didUpdateWidget(PasswordNoticeView oldWidget) {
    super.didUpdateWidget(oldWidget);

    setState(() {
      leastEightChar = false;
      mustNumberAndChar = false;
      leastThreeChae = false;
      twicePassword = false;

      if (widget.firstPassword.length >= 8 && widget.firstPassword.length <= 20) {
        leastEightChar = true;
      }

      if (hasDigitAndLetter(widget.firstPassword)) {
        mustNumberAndChar = true;
      }

      if (hasThreeDifrentChar(widget.firstPassword)) {
        leastThreeChae = true;
      }

      // 两次密码输入一致
      if (widget.firstPassword == widget.secondPassword && widget.secondPassword.isNotEmpty) {
        twicePassword = true;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PasswordCheckView(
          title: "至少8个字符,不超过20个字符",
          selected: leastEightChar,
        ),
        5.verticalSpace,
        PasswordCheckView(
          title: "必须包含字母数字",
          selected: mustNumberAndChar,
        ),
        5.verticalSpace,
        PasswordCheckView(
          title: "至少三个不同字符",
          selected: leastThreeChae,
        ),
        5.verticalSpace,
        PasswordCheckView(
          title: "两次密码输入必须一致",
          selected: twicePassword,
        ),
      ],
    );
  }
}
