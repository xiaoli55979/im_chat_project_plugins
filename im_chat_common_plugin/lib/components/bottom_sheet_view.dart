import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';

/// 买单确认界面
class BottomSheetView extends StatefulWidget {
  String? cancelTitle;
  Text? titleText;
  Text? contentText;
  List<MainButton>? actions;
  final VoidCallback onCancel;
  final bool? cancelDismiss;

  /// 点击取消是否关闭弹窗

  BottomSheetView({
    Key? key,
    this.cancelTitle = "取消",
    this.titleText,
    this.contentText,
    this.actions,
    this.cancelDismiss = true,
    required this.onCancel,
  }) : super(key: key);

  @override
  BottomSheetViewState createState() => BottomSheetViewState();
}

class BottomSheetViewState extends State<BottomSheetView> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 0,
          bottom: 5,
        ).r,
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (widget.titleText != null) 5.verticalSpace,
              if (widget.titleText != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.titleText!,
                  ],
                ),
              if (widget.titleText != null) 10.verticalSpace,
              if (widget.contentText != null) widget.contentText!,
              if (widget.contentText != null) 10.verticalSpace,
              if (widget.actions != null)
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(15.rl),
                  itemCount: widget.actions!.length,
                  itemBuilder: (BuildContext context, int index) {
                    MainButton action = widget.actions![index];
                    // action.height = 42.h;
                    return Container(
                      margin: const EdgeInsets.only(bottom: 15.0), // Adjust the bottom margin as needed
                      child: action,
                    );
                  },
                ),
              // 10.verticalSpace,
              MainButton(
                onPressed: () {
                  Get.back();
                  widget.onCancel.call();
                },
                backgroundColor: Colors.grey,
                text: widget.cancelTitle != null ? widget.cancelTitle! : "",
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
}
