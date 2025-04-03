import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:im_chat_common_plugin/components/password_check_view.dart';

class UserAccountNoticeView extends StatefulWidget {
  final String account;

  const UserAccountNoticeView({
    super.key,
    required this.account,
  });

  @override
  _UserAccountNoticeView createState() => _UserAccountNoticeView();
}

class _UserAccountNoticeView extends State<UserAccountNoticeView> {
  bool leastEightChar = false;
  bool mustNumberAndChar = false;
  bool startWithChar = false;

  /// 数字和字母
  bool hasDigitAndLetter(String str) {
    final RegExp regex = RegExp(r'(?=.*[0-9])(?=.*[a-zA-Z]).*');
    return regex.hasMatch(str);
  }

  /// 至少三个不同的字符
  bool hasThreeDifrentChar(String input) {
    final RegExp regex = RegExp(r'^[a-zA-Z].*$');
    return regex.hasMatch(input);
  }

  @override
  void didUpdateWidget(UserAccountNoticeView oldWidget) {
    super.didUpdateWidget(oldWidget);

    setState(() {
      leastEightChar = false;
      mustNumberAndChar = false;
      startWithChar = false;

      if (widget.account.length >= 6 && widget.account.length <= 20) {
        leastEightChar = true;
      }

      if (hasDigitAndLetter(widget.account)) {
        mustNumberAndChar = true;
      }

      if (hasThreeDifrentChar(widget.account)) {
        startWithChar = true;
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
          title: "以字母开头",
          selected: startWithChar,
        ),
        5.verticalSpace,
        PasswordCheckView(
          title: "必须包含字母数字",
          selected: mustNumberAndChar,
        ),
        5.verticalSpace,
        PasswordCheckView(
          title: "至少6个字符,不超过20个字符",
          selected: leastEightChar,
        ),
      ],
    );
  }
}
