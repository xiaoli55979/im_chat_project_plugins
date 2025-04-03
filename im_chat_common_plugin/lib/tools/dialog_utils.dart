import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../components/subtitle_text.dart';
import '../components/title_text.dart';
import 'font_utils.dart';

/// 弹窗工具类（包装一层，方便后续统一管理）
class DialogUtils {
  DialogUtils._();

  /// actionSheet
  static Future showActionSheet({
    Widget? title,
    bool showCancel = true,
    required List<BottomSheetAction> actions,
  }) {
    return showAdaptiveActionSheet(
        context: Get.context!, title: title, actions: actions, cancelAction: showCancel ? CancelAction(title: TitleText('取消')) : null);
  }

  /// 底部菜单
  static Future<T?> bottomSheet<T>({
    required WidgetBuilder builder,
    isScrollControlled = false,
    bool isDismissible = true,
    bool ignoreSafeArea = false,
    bool enableDrag = true,

    /// 滚动视图是否支持滑动关闭
    double? elevation,
  }) {
    return Get.bottomSheet<T>(
      builder(Get.context!),
      useRootNavigator: true,
      ignoreSafeArea: ignoreSafeArea,
      elevation: elevation,
      isDismissible: isDismissible,
      isScrollControlled: isScrollControlled,
      enableDrag: enableDrag,
    );
  }

  /// 关闭底部菜单
  static back() {
    Navigator.pop(Get.context!);
  }

  /// 显示弹窗
  static Future<void> dialog({required WidgetBuilder builder, String? tag, bool? clickMaskDismiss}) {
    // return showDialog(context: Get.context!, builder: builder);
    return SmartDialog.show(
      tag: tag,
      builder: builder,
      clickMaskDismiss: clickMaskDismiss,
    );
  }

  /// 关闭弹窗
  static Future<void> dismiss({String? tag}) {
    return SmartDialog.dismiss(tag: tag);
  }

  /// 关闭loading
  static Future<void> dismissLoading() {
    return SmartDialog.dismiss(status: SmartStatus.loading);
  }

  /// 加载中
  static Future<void> loading({String? msg}) {
    return SmartDialog.showLoading(msg: msg ?? "加载中...");
  }

  /// toast
  static Future<void> toast(String msg, {displayType = SmartToastType.onlyRefresh}) {
    return SmartDialog.showToast(msg, displayType: displayType);
  }

  /// 信息显示
  static Future<void> showInfo(String msg) {
    return EasyLoading.showInfo(msg, duration: const Duration(milliseconds: 3500));
  }

  /// 成功显示
  static Future<void> showSuccess(String msg) {
    return EasyLoading.showSuccess(msg, duration: const Duration(milliseconds: 3500));
  }

  /// 错误显示
  static Future<void> showError(String msg) {
    return EasyLoading.showError(msg, duration: const Duration(milliseconds: 3500));
  }

  ///SnackBart提示
  static showSnackBar({
    required String content,
    BuildContext? context,
    Duration? duration,
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(context ?? Get.context!).showSnackBar(
      SnackBar(
        content: Text(content),
        duration: duration ?? Duration(seconds: 1),
        backgroundColor: backgroundColor ?? Colors.black,
      ),
    );
  }

  /// 提示框
  static Future<void> alert({title = "提示", required String content}) {
    return dialog(
        builder: (c) => AlertDialog(
              scrollable: true,
              title: Text(
                title,
                style: TextStyle(
                  fontSize: FontUtils.contentFontSize,
                ),
              ),
              content: Text(content),
            ));
  }

  ///发现新版本
  static Future<void> findVersion(
      {title = "提示",
      bool? clickMaskDismiss,
      Color? contentColor,
      bool? canIgnore,
      String? version,
      bool havePlist = false,
      required String content,
      required VoidCallback onOk,
      VoidCallback? onInstall,
      VoidCallback? onCancel}) {
    return dialog(
        clickMaskDismiss: clickMaskDismiss,
        builder: (context) => PopScope(
            canPop: false,
            onPopInvoked: (bool didPop) {
              if (didPop) {
                return;
              }
            },
            child: AlertDialog(
              scrollable: true,
              title: Text(
                title,
                style: TextStyle(
                  fontSize: FontUtils.contentFontSize,
                ),
              ),
              content: Text(
                content,
                style: TextStyle(color: contentColor),
              ),
              actions: [
                Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      version != null
                          ? Text(
                              " 当前安装版本:V$version",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: FontUtils.contentFontSize,
                              ),
                            )
                          : const Text(""),
                    ],
                  ),
                ]),
                2.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    canIgnore!
                        ? TextButton(
                            onPressed: () {
                              dismiss();
                              onCancel?.call();
                            },
                            child: Text(
                              '忽略',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: FontUtils.contentFontSize,
                              ),
                            ),
                          )
                        : const Text(""),
                    if (havePlist)
                      TextButton(
                        onPressed: () {
                          onInstall?.call();
                        },
                        child: Text(
                          '立即安装',
                          style: TextStyle(
                            fontSize: FontUtils.contentFontSize,
                          ),
                        ),
                      ),
                    TextButton(
                      onPressed: () {
                        // dismiss();
                        onOk.call();
                      },
                      child: Text(
                        '去官网升级',
                        style: TextStyle(
                          fontSize: FontUtils.contentFontSize,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }

  /// 确认框
  static Future<void> confirm({
    title = "提示",
    bool? cancelDismiss = true,
    bool? okDismiss = true,

    /// 点击取消是否关闭弹窗
    bool? clickMaskDismiss,
    Color? contentColor,
    FontWeight? fontWeight = FontWeight.normal,
    String? okTitle,
    Color? okTitleColor,
    String? cancelTitle,
    Color? cancelTitleColor,
    String? thirdTitle,
    Color? thirdTitleColor,
    required String content,
    required VoidCallback onOk,
    VoidCallback? onThird,
    VoidCallback? onCancel,
  }) {
    return dialog(
        clickMaskDismiss: clickMaskDismiss,
        builder: (c) => AlertDialog(
              scrollable: true,
              title: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: FontUtils.contentTitleFontSize,
                ),
              ),
              content: SubtitleText(
                content,
                style: TextStyle(
                  color: contentColor,
                  fontWeight: fontWeight,
                ),
              ),
              actions: onCancel == null
                  ? [
                      TextButton(
                        onPressed: () {
                          if (okDismiss != null && okDismiss) {
                            dismiss();
                          }

                          onOk.call();
                        },
                        child: TitleText(okTitle ?? "确定"),
                      ),
                    ]
                  : [
                      TextButton(
                        onPressed: () {
                          dismiss();
                          onCancel.call();
                        },
                        child: Text(
                          cancelTitle ?? '取消',
                          style: TextStyle(
                            color: cancelTitleColor ?? Colors.black54,
                            fontSize: FontUtils.contentTitleFontSize,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (okDismiss != null && okDismiss) {
                            dismiss();
                          }

                          onOk.call();
                        },
                        child: TitleText(
                          okTitle ?? "确定",
                          style: TextStyle(
                            color: okTitleColor ?? Colors.black54,
                            fontSize: FontUtils.contentTitleFontSize,
                          ),
                        ),
                      ),
                      if (thirdTitle != null)
                        TextButton(
                          onPressed: () {
                            if (onThird != null) {
                              onThird.call();
                            }
                          },
                          child: Text(
                            thirdTitle,
                            style: TextStyle(
                              color: thirdTitleColor ?? Colors.black54,
                              fontSize: FontUtils.contentTitleFontSize,
                            ),
                          ),
                        ),
                    ],
            ));
  }
}
