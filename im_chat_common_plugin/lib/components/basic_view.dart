import 'package:flutter/material.dart';

class BasicView extends StatelessWidget {
  final String? title; // 标题
  final List<Widget>? actions; // AppBar 的操作按钮
  final Widget? leading;
  final Widget? body; // 主体内容
  final Widget? bottomWidget; // 底部组件
  final Color? backGroundColor; // 底部组件
  final bool resizeToAvoidBottomInset; // 是否避免键盘覆盖

  const BasicView({
    Key? key,
    this.title,
    this.actions,
    this.leading,
    this.body,
    this.bottomWidget,
    this.backGroundColor,
    this.resizeToAvoidBottomInset = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: title != null
          ? AppBar(
              title: Text(title ?? "", style: const TextStyle(color: Colors.black, fontSize: 18)),
              actions: actions,
              leading: leading ?? null,
            )
          : null,
      backgroundColor: backGroundColor ?? Color(0xFFF0F0F0),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          top: false,
          child: Container(
                color: backGroundColor ?? Color(0xFFF0F0F0),
                child: body,
              ) ??
              const SizedBox.shrink(),
        ),
      ),
      bottomNavigationBar: bottomWidget,
    );
  }
}
