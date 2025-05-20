import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension CommonDialog on GetInterface {

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
