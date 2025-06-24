import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/config/color/colors.dart';
import 'package:im_chat_common_plugin/util/fonts.dart';
import 'package:im_chat_common_plugin/widget/button/common_button.dart';

extension CommonDialog on GetInterface {

  Future<T?> normalDialog<T>({
    required String content,
    TextAlign contentAlign = TextAlign.center,
    double? width,
    double? radius,
    double? topPadding,
    String? title,
    double? contentSize,
    Color? contentColor,
    bool showCancelBtn = true,
    String? cancelText,
    VoidCallback? cancelAction,
    String? confirmText,
    VoidCallback? confirmAction,
    bool? barrierDismissible,
  }) {
    return Get.generalDialog(
      barrierDismissible: barrierDismissible ?? true,
      barrierLabel: MaterialLocalizations.of(key.currentContext!)
          .modalBarrierDismissLabel,
      barrierColor: Colors.black.withOpacity(0.4),
      pageBuilder: (context, animation, secondaryAnimation) => ScaleTransition(
        scale: animation,
        child: Center(
            child: Container(
              width: width ?? 320,
              decoration: BoxDecoration(
                color: IMColors.white,
                borderRadius: BorderRadius.circular(radius ?? 18),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: topPadding ?? 25),
                  if (title != null && title.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: CommonText.instance(
                        title,
                        16,
                        fontWeight: CommonFontWeight.semiBold,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CommonText.instance(
                      content,
                      contentSize ?? 14,
                      color: contentColor ?? IMColors.normalTextColor,
                      textAlign: contentAlign,
                    ),
                  ),
                  SizedBox(height: 28),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        if(showCancelBtn)
                            ...[
                              Expanded(
                                child: CommonButton(
                                  padding: EdgeInsets.zero,
                                  borderRadius: BorderRadius.circular(12),
                                  color:
                                  IMColors.normalTextColor.withOpacity(
                                      0.3),
                                  minSize: 48,
                                  onPressed: () {
                                    Navigator.pop(context);
                                    if (cancelAction != null) {
                                      cancelAction();
                                    }
                                  },
                                  child: CommonText.instance(
                                    cancelText ?? '取消',
                                    16,
                                    fontWeight: CommonFontWeight.semiBold,
                                    color: IMColors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: 30),
                            ],
                        Expanded(
                          child: CommonButton(
                            padding: EdgeInsets.zero,
                            borderRadius: BorderRadius.circular(12),
                            color: IMColors.primaryColor,
                            minSize: 48,
                            onPressed: () {
                              Navigator.pop(context);
                              if (confirmAction != null) {
                                confirmAction();
                              }
                            },
                            child: CommonText.instance(
                              confirmText ?? '确定',
                              16,
                              fontWeight: CommonFontWeight.semiBold,
                              color: IMColors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                ],
              ),
            ),
        ),
      ),
    );
  }

  Future<T?> customDialog<T>({
    required Widget widget,
    bool? barrierDismissible,
  }) {
    return Get.generalDialog(
      barrierDismissible: barrierDismissible ?? true,
      barrierLabel: MaterialLocalizations.of(key.currentContext!)
          .modalBarrierDismissLabel,
      barrierColor: Colors.black.withOpacity(0.4),
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: widget,
        );
      },
    );
  }
}