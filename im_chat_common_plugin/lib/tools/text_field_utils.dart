import 'dart:convert';
import 'dart:math';

import 'package:common_utils/common_utils.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as p;
import 'package:uuid/uuid.dart';

enum ImageCategory {
  none, // 根路径
  sfz, // 身份证图片
  rn, // 人脸图片
  zfpz, // 支付凭证
  zcpz, // 仲裁凭证
  qxpz, // 交易取消凭证
  cupz, // 充U凭证
  cbpz, // 催办凭证
  rnsh, // 人脸审核
  yhjy, // 用户建议
  im, // im
}

extension ImageCategoryExtension on ImageCategory {
  String get path {
    switch (this) {
      case ImageCategory.sfz:
        return "sm/sfz";
      case ImageCategory.rn:
        return "sm/rn";
      case ImageCategory.zfpz:
        return "jy/zfpz";
      case ImageCategory.zcpz:
        return "jy/zcpz";
      case ImageCategory.qxpz:
        return "jy/qxpz";
      case ImageCategory.cupz:
        return "jy/cupz";
      case ImageCategory.cbpz:
        return "jy/cbpz";
      case ImageCategory.rnsh:
        return "sh/rnsh";
      case ImageCategory.yhjy:
        return "sh/yhjy";
      case ImageCategory.im:
        return "im";
      default:
        return "";
    }
  }
}

class TextFieldUtils {
  TextFieldUtils._();

  /// 生成UUID
  static String uuid() {
    return const Uuid().v4();
  }

  /// 生成新的OSS路径
  static String objectKeyNew(String path, {ImageCategory? headPath}) {
    String headPathLocal = "";
    if (headPath != null) {
      headPathLocal = "${headPath.path}/";
    }

    // 获取当前时间戳
    int currentTimeMillis = DateTime.now().millisecondsSinceEpoch;

    // 格式化为 "yyyy" 和 "MMdd"
    String year = DateUtil.formatDateMs(currentTimeMillis, format: "yyyy");
    String mmdd = DateUtil.formatDateMs(currentTimeMillis, format: "MMdd");
    path = "$headPathLocal$year/$mmdd/${uuid()}${p.extension(path)}";
    debugPrint("objectKeyNew:$path");
    return path;
  }

  /// 判断值是否相等
  static FormFieldValidator<T> valueEqual<T>(String? Function() getValue, {String errorText = "两次密码输入不一致"}) {
    return (value) {
      var otherVal = getValue();
      if (otherVal != null && otherVal != value) {
        return errorText;
      }
    };
  }

  /// 判断是否上传成功
  static FormFieldValidator<List> checkImageUpload({String errorText = "文件尚未上传成功"}) {
    return (list) {
      if (list != null) {
        for (var img in list) {
          if (img.url == null || img.url == "") {
            return errorText;
          }
        }
      }
    };
  }

  /// 时间格式化显示
  static String constructTimeTwo(int seconds) {
    int day = seconds ~/ 3600 ~/ 24;
    int hour = seconds ~/ 3600 % 24;
    int minute = seconds % 3600 ~/ 60;
    int second = seconds % 60;
    if (day != 0) {
      return '${formatTime(day)}:${formatTime(hour)}:${formatTime(minute)}:${formatTime(second)}';
    } else if (hour != 0) {
      return "${formatTime(hour)}:${formatTime(minute)}:${formatTime(second)}";
    } else {
      return "${formatTime(minute)}:${formatTime(second)}";
    }
  }

  static String formatTime(int timeNum) {
    return timeNum < 10 ? "0$timeNum" : timeNum.toString();
  }

  /// 清除空格
  static String? removeBlank(dynamic text) {
    if (text is String) {
      return text.removeAllWhitespace;
    } else if (text is String?) {
      if (text != null) {
        return text.removeAllWhitespace;
      }
    }
    return null;
  }

  ///银行卡号每四位加一个分隔符
  static TextEditingValue addSeparator(String text, {String separator = " "}) {
    if (text.isEmpty) {
      return TextEditingValue(text: text);
    }

    ///移除了分隔符
    var removeSeparator = text.replaceAll(separator, "");
    var list = removeSeparator.split("");
    int separatorCount = 0;
    for (var i = 0; i < removeSeparator.length; i = i + 4) {
      if (i == 0) continue;
      list.insert(i + separatorCount, separator);
      separatorCount++;
    }
    var endText = list.join("");
    return TextEditingValue(
      text: endText,
      selection: TextSelection(
        baseOffset: endText.length,
        extentOffset: endText.length,
        affinity: TextAffinity.upstream,
      ),
    );
  }

  static IconData cnyIcon() {
    const IconData cny = IconData(0x00A5, fontFamily: 'CustomIcons');
    return cny;
  }

  /// 替换指定字符串
  static String replaceString(String content, String key, String replaceStr) {
    String replacedString = content.replaceAll(key, replaceStr);
    return replacedString;
  }

  /// 从html code标签中取出code
  static Map<String, dynamic>? getJsonMapFromHtml(String htmlString) {
    try {
      // print("object_jsonMap1:${htmlString}");
      RegExp regExp = RegExp(r'<code[^>]*>(.*?)<\/code>', multiLine: true, dotAll: true);
      String? codeString = regExp.firstMatch(htmlString)?.group(1)?.trim();
      // print("object_jsonMap2:${codeString}");
      Map<String, dynamic> jsonMap = json.decode(codeString!);
      // print("object_jsonMap:${jsonMap.toString()}");
      return jsonMap;
    } catch (e) {
      // LoggerUtils.error(e, error: "html标签模式数据转换异常", level: LogLevel.ERROR);
      return null;
    }
  }

  /// 字符串中间加星号
  ///  addLength: 替换几个带星号的
  ///  asterLength:返回数据中带几个星号
  static String addAsterisksInMiddle(String input, {int? addLength, int? asterLength}) {
    // print("object_input:$input  length:$addLength");
    if (addLength != null && addLength >= input.length) {
      // print("addLength should be less than the length of input string");
      return input;
    }

    int midIndex = input.length ~/ 2; // 找到字符串的中间位置

    // 根据字符串的奇偶长度来确定替换的起始位置和长度
    int startIndex = input.length.isEven ? midIndex - addLength! ~/ 2 : midIndex - addLength! ~/ 2 - 1;
    int replaceLength = addLength!;

    // 生成 * 的字符串
    int length = 4; // 默认为4个星号
    if (asterLength != null && asterLength > 0) {
      length = asterLength;
    }
    String asterisks = "*" * length;
    // 将字符串中间的字符替换为 *
    String result = input.replaceRange(startIndex, startIndex + replaceLength, asterisks);

    return result;
  }

  /// 获取一个指定长度字符串,默认16
  static String getRadomAESIV({int? length}) {
    length ??= 16;
    const charset = 'abcdefghijklmnopqrstuvwxyz0123456789';
    Random random = Random();
    return List.generate(length, (index) {
      return charset[random.nextInt(charset.length)];
    }).join();
  }

  /// 获取一个指定长度字符串,默认16
  static String getRadomCode({int? length}) {
    // return "axshq12389012324";
    length ??= 16;
    const charset = 'abcdefghijklmnopqrstuvwxyz0123456789';
    Random random = Random();
    return List.generate(length, (index) {
      return charset[random.nextInt(charset.length)];
    }).join();
  }

  /// 获取<>中间的字符串
  static String getOrderNoFromStr(String inputStr) {
    RegExp regExp = RegExp(r'<(.*?)>'); // 使用非贪婪模式匹配<>中的内容
    Match match = regExp.firstMatch(inputStr) as Match;
    String? result = match.group(1); // 提取匹配到的内容
    print(result); // 输出匹配到的字符串
    if (result != null) {
      return result;
    } else {
      return "";
    }
  }

  /// 传入的字符串生成md5
  static String getMD5FromString(String input) {
    // 808-username
    // Convert the input string to bytes
    var bytes = utf8.encode(input);

    // Compute the MD5 hash
    var digest = md5.convert(bytes);

    // Convert the hash to a hexadecimal string
    return digest.toString();
  }

  /// 替换<>的字符串
  static String replacePlaceholders(String input, String keyString) {
    String result = input.replaceAllMapped(
      RegExp(r'<(.*?)>'),
      (match) => keyString, // 这里将所有匹配到的占位符都替换为 keyString
    );
    return result;
  }

  /// 获取<>中间的字符串
  static String getErrorCode(String inputStr) {
    try {
      RegExp regExp = RegExp(r'\((\d+)\)'); // 正则表达式匹配括号内的数字
      Match match = regExp.firstMatch(inputStr) as Match;
      String? result = match.group(1); // 提取匹配到的内容
      if (result != null) {
        return result;
      } else {
        return "";
      }
    } catch (e) {
      return "";
    }
  }

  /// 移除字符串的空格
  static String removeSpace(String inputStr) {
    String trimmedString = inputStr.replaceAll(RegExp(r'\s+'), '');
    // trimmedString = trimmedString.toLowerCase();
    // print("object_input:$inputStr out:$trimmedString");
    return trimmedString;
  }

  static int getRandomNumber(int maxValue) {
    Random random = Random();
    return random.nextInt(maxValue);
  }

  /// 获取APP名称
  static String getAppName() {
    return "测试APP"; //SlocalUtils.getLocalizaContent(SlocalUtils.of(Get.context!).lianfuAppName);
  }

  /// 返回随机字符串
  static String getRandomSubstring(int minLength, int maxLength, {bool? hanzi}) {
    String text = "abcdefghijklmnopqrstuvwxyz1234567890";
    String textContent = "";
    if (hanzi != null && hanzi!) {
      text = textContent;
    }

    if (text.isEmpty || minLength <= 0 || maxLength <= 0 || minLength > maxLength) {
      throw ArgumentError('Invalid input parameters.');
    }

    final random = Random();
    final textLength = text.length;

    // Ensure maxLength does not exceed the text length
    final effectiveMaxLength = min(maxLength, textLength);

    // Randomly choose the length of the substring
    final length = minLength + random.nextInt(effectiveMaxLength - minLength + 1);

    // Randomly choose the start index such that the substring fits within the text
    final startIndex = random.nextInt(textLength - length + 1);

    return text.substring(startIndex, startIndex + length);
  }

  /// 根据url获取文件类型
  static int getFileType(String url) {
    // print("object_getFileType:${url}");
    // 定义图片后缀
    const imageExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp', 'svg'];
    // 定义视频后缀
    const videoExtensions = ['mp4', 'avi', 'mov', 'wmv', 'flv', 'mkv', 'webm', 'm4v'];

    // 从 URL 中提取文件后缀
    String extension = url.split('.').last.toLowerCase();

    // 判断后缀是否在图片后缀列表中
    if (imageExtensions.contains(extension)) {
      return 2; // 返回 1 表示图片
    }
    // 判断后缀是否在视频后缀列表中
    else if (videoExtensions.contains(extension)) {
      return 3; // 返回 2 表示视频
    } else {
      return 1; // 返回 0 表示未知文件类型
    }
  }

  /// 字符串转base64
  static String stringToBase64(String input) {
    List<int> bytes = utf8.encode(input);
    String base64Str = base64Encode(bytes);
    return base64Str;
  }

  /// base64转字符串
  static String base64ToString(String base64String) {
    List<int> bytes = base64Decode(base64String);
    String decodedString = utf8.decode(bytes);
    return decodedString;
  }
}
