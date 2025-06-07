import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/assets.dart';

enum ToastType { none, error, succeed }

class Toast {
  /// 异步hud
  static Future<T> showFutureHUD<T>({required final Future<T> future}) async {
    final hud = BotToast.showLoading();
    return future.whenComplete(() {
      hud();
    });
  }

  /// 显示hud
  static showHUD() {
    // BotToast.showLoading();
    BotToast.showCustomLoading(
      toastBuilder: (context) {
        return Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(color: const Color(0x66252526), borderRadius: BorderRadius.circular(12.w)),
          width: 88.w,
          height: 88.w,
          child: const CircularProgressIndicator(color: Color(0xff252526)),
        );
      },
    );
  }

  /// 取消hud
  static dismmHUD() {
    BotToast.closeAllLoading();
  }

  /// 清除所有的toast
  static removeToast() {
    BotToast.removeAll();
  }

  /// 显示提示
  static showToast(
      String message, {
        Color bgColor = const Color(0x80252526),
        Duration duration = const Duration(seconds: 3),
      }) {
    BotToast.showCustomNotification(
      duration: duration, // 设置显示时长
      // align: const Alignment(0.0, 0.9),
      animationDuration: const Duration(milliseconds: 0),
      toastBuilder: (e) {
        return toast(message, ToastType.none, bgColor);
      },
    );
  }

  /// 居中显示提示
  static showToastCenter(String message, {Color bgColor = const Color(0x80000000)}) {
    BotToast.showCustomNotification(
      align: Alignment.center,
      animationDuration: const Duration(milliseconds: 0),
      toastBuilder: (e) {
        return toast(message, ToastType.none, bgColor);
      },
    );
  }

  /// 显示成功提示
  static showSucceedToast(String message, {Color bgColor = const Color(0x80000000)}) {
    BotToast.showCustomNotification(
      align: const Alignment(0.0, 0.9),
      animationDuration: const Duration(milliseconds: 0),
      toastBuilder: (e) {
        return toast(message, ToastType.succeed, bgColor);
      },
    );
  }

  /// 显示错误提示
  static showErrorToast(String message, {Color bgColor = const Color(0x80000000)}) {
    BotToast.showCustomNotification(
      align: const Alignment(0.0, 0.9),
      animationDuration: const Duration(milliseconds: 0),
      toastBuilder: (e) {
        return toast(message, ToastType.error, bgColor);
      },
    );
  }

  /// 自定义 toast 样式
  static Widget toast(String message, ToastType type, Color bgColor) {
    // return Container(
    //   margin: const EdgeInsets.only(bottom: 60),
    //   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
    //   decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(20.0)),
    //   constraints:  BoxConstraints(
    //     maxWidth: 280.w, // 限制宽度自动换行
    //   ),
    //   child: Row(
    //     mainAxisSize: MainAxisSize.min,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Expanded(
    //         child: Text(
    //           message,
    //           softWrap: true,
    //           textAlign: TextAlign.center,
    //           style: const TextStyle(color: Colors.white, fontSize: 14),
    //         ),
    //       ),
    //       if (type != ToastType.none) const SizedBox(width: 8.0),
    //       if (type == ToastType.succeed) const Icon(Icons.check, color: Colors.white, size: 18),
    //       if (type == ToastType.error) const Icon(Icons.clear, color: Colors.white, size: 18),
    //     ],
    //   ),
    // );
    return Center(
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(12.w)),
        constraints: BoxConstraints(
          maxWidth: 267.w, // 限制宽度自动换行
          minWidth: 136.w,
        ),
        child: IntrinsicWidth(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (type != ToastType.none) Container(),
              if (type == ToastType.succeed)
                Padding(
                  padding: EdgeInsets.only(bottom: 12.w),
                  child: Image.asset(Assets.assetsToastSuccess, width: 24.w, height: 24.w),
                ),
              if (type == ToastType.error)
                Padding(
                  padding: EdgeInsets.only(bottom: 12.w),
                  child: Image.asset(Assets.assetsToastFail, width: 24.w, height: 24.w),
                ),
              // Expanded(
              //   child: Text(
              //     message,
              //     softWrap: true,
              //     textAlign: TextAlign.center,
              //     style: const TextStyle(color: Colors.white, fontSize: 14),
              //   ),
              // ),
              Text(
                message,
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 15.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
