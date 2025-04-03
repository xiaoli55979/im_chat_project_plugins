import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:common_utils/common_utils.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:heif_converter/heif_converter.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as path_provider;

class ImageCompressUtil {
  /// 检查支持的文件类型
  static bool checkImageFormat(String fileName) {
    var ext = p.extension(fileName.toLowerCase());
    return [".jpeg", ".jpg", ".png", ".webp", ".heic"].contains(ext);
  }

  /// 保存并压缩
  static Future<File?> saveAndCompress(String base64Image) async {
    var dir = await path_provider.getTemporaryDirectory();
    var targetPath = "${dir.absolute.path}/${DateTime.now().millisecondsSinceEpoch}.jpg}";
    var targetFile = File(targetPath);
    var bytes = base64Decode(base64Image);
    targetFile.writeAsBytesSync(bytes);
    return compress(targetFile);
  }

  /// 图片压缩targetSize 指定压缩大小
  static Future<File?> compress(File input, {int? targetSize, minWidth = 1280, minHeight = 720}) async {
    var fileLen = input.lengthSync();
    // 小于200KB 不压缩
    if (fileLen < 200 * 1024) {
      return input;
    }
    var quality = 100;
    if (fileLen > 6 * 1024 * 1024) {
      // 大于6MB
      quality = 30;
    } else if (fileLen > 4 * 1024 * 1024) {
      // 大于4MB
      quality = 40;
    } else if (fileLen > 2 * 1024 * 1024) {
      // 大于2MB
      quality = 45;
    } else if (fileLen > 1 * 1024 * 1024) {
      // 大于1MB
      quality = 55;
    } else if (fileLen > 0.5 * 1024 * 1024) {
      // 大于0.5MB
      quality = 65;
    } else if (fileLen > 0.25 * 1024 * 1024) {
      // 大于0.25MB
      quality = 70;
    }

    /// 压缩图片类型判断
    String filePath = input.path.toLowerCase();
    print("object_map_compress:${filePath}");
    var format = CompressFormat.jpeg;
    if (filePath.endsWith("png")) {
      format = CompressFormat.png;
    } else if (filePath.endsWith("jpg") || filePath.endsWith("jpeg")) {
      format = CompressFormat.jpeg;
    } else if (filePath.endsWith("webp") && Platform.isAndroid) {
      format = CompressFormat.webp;
    } else if (filePath.endsWith("heic")) {
      format = CompressFormat.heic;
      String? heicfilePath = await heicToPng(filePath);
      if (heicfilePath != null) {
        filePath = heicfilePath;
        format = CompressFormat.png;
        // print("filePath_Heic:${filePath}");
      }
    } else {
      /// 不支持的格式,忽略压缩
      return input;
    }

    var dir = await path_provider.getTemporaryDirectory();
    var targetPath = "${dir.absolute.path}/${DateTime.now().millisecondsSinceEpoch}_${p.basename(input.path)}";
    LogUtil.v(targetPath, tag: "上传路径");
    try {
      var result = await FlutterImageCompress.compressAndGetFile(
        input.absolute.path,
        targetPath,
        quality: quality,
        rotate: 0,
        format: format,
        minWidth: minWidth,
        minHeight: minHeight,
      );
      var resultLen = await result?.length();
      // LogUtil.v(resultLen, tag: "压缩后");
      // if (targetSize != null && resultLen != null) {
      //   while (true) {
      //     // 结果偏大再次压缩
      //     quality = quality - 3;
      //     String inputPath = targetPath;
      //     targetPath =
      //         "${dir.absolute.path}/${DateTime.now().millisecondsSinceEpoch}_${quality}_${p.basename(input.path)}";
      //     print("object_inputPath:${inputPath}");
      //     print("object_targetPath:${targetPath}");
      //     var result2 = await FlutterImageCompress.compressAndGetFile(inputPath, targetPath,
      //         quality: quality, rotate: 0, format: format, minWidth: minWidth, minHeight: minHeight);
      //     var resultLen2 = await result2?.length();
      //     print("压缩结果偏大再次压缩_object:${resultLen2}  quality:${quality}");
      //     if (quality <= 25) break;
      //   }
      // }

      LogUtil.v(quality, tag: "压缩比");
      LogUtil.v(fileLen, tag: "压缩前");
      LogUtil.v(resultLen, tag: "压缩后");
      if (result != null) {
        return File(result.path);
      }
    } on CompressError catch (e) {
      LogUtil.v(e.message, tag: "图片压缩失败");
    }
    return input;
  }

  /// 图片格式统一转换成png
  static Uint8List convertImageToPng(base64Image) {
    var bytes = base64Decode(base64Image);

    // Load the image
    img.Image? image = img.decodeImage(bytes);

    // Convert the image to PNG format
    img.Image pngImage = img.copyResize(image!, width: image.width, height: image.height);

    Uint8List pngBytes = Uint8List.fromList(img.encodePng(pngImage));
    return pngBytes;
  }

  static Future<String?> heicToPng(heicPath) async {
    String? pngPath = await HeifConverter.convert(heicPath, format: 'png');
    return pngPath;
  }
}
