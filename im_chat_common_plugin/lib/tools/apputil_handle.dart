import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:im_chat_common_plugin/tools/permissions_utils.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'my_shared_pref.dart';

typedef CacheClearCallback = void Function(bool success);

class ApputilHandle {
  Future<Uint8List?> takeScreenshotWithMargin(GlobalKey boundaryKey) async {
    try {
      // 获取要截图的区域
      RenderRepaintBoundary boundary = boundaryKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      await Future.delayed(const Duration(milliseconds: 20)); // 延迟以确保渲染完成

      // 获取原始图像
      ui.Image image = await boundary.toImage(pixelRatio: 3.0); // 调整分辨率

      // 获取图像的尺寸
      int width = image.width;
      int height = image.height;

      // 获取屏幕宽度
      double screenWidth = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;

      // 计算黑色边距（屏幕剩余宽度的一半）
      int margin = ((screenWidth - width) / 2).toInt(); // 黑色边距的大小，取屏幕剩余宽度的一半

      // 如果边距为负值，至少设为 20（避免边距为负数）
      margin = margin < 20 ? 20 : margin;

      // 设置新宽度和高度
      int newWidth = width + 2 * margin; // 新的宽度
      int newHeight = height + 2 * margin; // 新的高度

      // 创建一个新的画布，尺寸为原图加上边距
      final recorder = ui.PictureRecorder();
      final canvas = Canvas(recorder, Rect.fromPoints(Offset(0, 0), Offset(newWidth.toDouble(), newHeight.toDouble())));

      // 绘制黑色背景
      canvas.drawRect(Rect.fromLTWH(0, 0, newWidth.toDouble(), newHeight.toDouble()), Paint()..color = Colors.transparent);

      // 将原始图像绘制到新画布的中心
      canvas.drawImage(image, Offset(margin.toDouble(), margin.toDouble()), Paint());

      // 生成新的图像（带黑色边距）
      final picture = recorder.endRecording();
      final img = await picture.toImage(newWidth, newHeight);

      // 将图像数据转为字节数据
      ByteData? byteData = await img.toByteData(format: ui.ImageByteFormat.png);
      if (byteData != null) {
        return byteData.buffer.asUint8List();
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  /// 保存带边距的截图
  void saveScreenshotWithMargin(GlobalKey boundaryKey) async {
    // 获取相册权限
    PermissionsUtils.requestAllPermission((status) async {
      if (status) {
        SmartDialog.showLoading(msg: "加载中...");
        // 获取带边距的截图字节数据
        Uint8List? screenshotBytes = await takeScreenshotWithMargin(boundaryKey);
        SmartDialog.dismiss(status: SmartStatus.loading);
        if (screenshotBytes != null) {
          try {
            // 保存图片
            final result = await ImageGallerySaverPlus.saveImage(screenshotBytes);
            if (result == null || result == '') throw '图片保存失败';
            // 显示保存成功的提示
            SmartDialog.showToast("二维码保存成功!", displayType: SmartToastType.onlyRefresh);
          } catch (e) {
            SmartDialog.showToast("二维码保存失败!", displayType: SmartToastType.onlyRefresh);
          }
        }
      } else {
        EasyLoading.showError("保存失败,相册未授权");
      }
    });
  }

  /// 获取缓存大小
  Future<String> calculateCacheSize() async {
    Directory appCacheDir = await getTemporaryDirectory();
    int cacheSizeBytes = await _calculateDirectorySize(appCacheDir);
    double cacheSizeMB = cacheSizeBytes / (1024 * 1024);
    return cacheSizeMB.toStringAsFixed(2);
  }

  Future<int> _calculateDirectorySize(Directory directory) async {
    int totalSize = 0;

    await for (FileSystemEntity entity in directory.list(recursive: true, followLinks: false)) {
      if (entity is File) {
        totalSize += await entity.length();
      }
    }
    return totalSize;
  }

  void clearCache(CacheClearCallback callback) async {
    try {
      /// 清除接口缓存key
      MySharedPref.setClearCashKey(cashKey: "");

      /// 清除文件缓存
      Directory appCacheDir = await getTemporaryDirectory();
      if (appCacheDir.existsSync()) {
        await appCacheDir.delete(recursive: true);
        callback(true); // Invoke the callback with true if cache is successfully cleared
      } else {
        callback(false); // Invoke the callback with false if cache directory doesn't exist
      }
    } catch (e) {
      callback(false); // Invoke the callback with false in case of an error
    }
  }

  /// 判断url是否是apk地址
  static bool isApkUrl(String url) {
    // 获取URL的最后一个斜杠后的部分，通常是文件名
    String fileName = url.split('/').last;

    // 判断文件名是否以.apk结尾
    return fileName.toLowerCase().endsWith('.apk');
  }

  /// 判断url是否是plist地址
  static bool isPlistUrl(String url) {
    // 获取URL的最后一个斜杠后的部分，通常是文件名
    String fileName = url.split('/').last;

    // 判断文件名是否以.apk结尾
    return fileName.toLowerCase().endsWith('.plist');
  }

  // 去官网
  static Future<void> gotoOfficeWebsite(String urlsStr, {Function(bool)? callback}) async {
    try {
      /// 官网 EncryptionUtil.decryptBase64("aHR0cDovLzgwOC5jb20=")
      final Uri url = Uri.parse(urlsStr);
      if (!await launchUrl(url)) {
        // onUpdateBugly("网址打开失败:$urlsStr");
        if (callback != null) {
          callback(false);
        }
      } else {
        if (callback != null) {
          callback(true);
        }
      }
    } catch (e) {
      // onUpdateBugly("网址打开失败:$urlsStr");
      if (callback != null) {
        callback(false);
      }
    }
  }

  // 去官网
  static Future<void> gotoWebsite(url) async {
    try {
      String modifiedString = url.replaceAll("%09", "");
      Uri uri = Uri.parse(modifiedString);
      if (!await launchUrl(uri)) {
        // onUpdateBugly("网址打开失败:$url");
      }
    } catch (e) {
      // onUpdateBugly("网址打开失败:$url");
    }
  }
}
