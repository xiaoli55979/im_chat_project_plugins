import 'package:im_chat_common_plugin/tools/tools_utils.dart';
import 'package:intl/intl.dart';

import 'my_shared_pref.dart';

class TimeToolsUtils {
  TimeToolsUtils._();

  /// 通过秒返回小时
  static int getHourFromCount(int seconds) {
    int hours = seconds ~/ 3600;
    return hours;
  }

  /// 通过秒返回分钟
  static int getMinutesFromCount(int seconds) {
    int minutes = (seconds % 3600) ~/ 60;
    return minutes;
  }

  /// 通过秒返回秒
  static int getSecondsFromCount(int seconds) {
    int remainingSeconds = seconds % 60;
    return remainingSeconds;
  }

  /// 时间戳返回指定时间格式
  static String getFormatTime(int timestamp) {
    // 将Unix时间戳转换为DateTime对象
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

    // 格式化日期和时间
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(date);

    print('Formatted Date: $formattedDate');
    return formattedDate;
  }

  /// dateTimeStr 起始时间  secondsToAdd 分钟  返回起始时间+分钟后的时间
  static String addSeconds(String dateTimeStr, int secondsToAdd) {
    secondsToAdd = secondsToAdd * 60;
    DateTime dateTime = DateTime.parse(dateTimeStr);
    DateTime resultDateTime = dateTime.add(Duration(seconds: secondsToAdd));
    String formattedDateTime =
        '${resultDateTime.year}-${resultDateTime.month.toString().padLeft(2, '0')}-${resultDateTime.day.toString().padLeft(2, '0')} '
        '${resultDateTime.hour.toString().padLeft(2, '0')}:${resultDateTime.minute.toString().padLeft(2, '0')}:${resultDateTime.second.toString().padLeft(2, '0')}';
    return formattedDateTime;
  }

// 返回指定格式的时间 2024-05-16 02:45:00
  static String formatDateTime(String dateTimeStr, {bool year = false, bool monthDay = false, bool time = false}) {
    try {
      DateTime dateTime = DateTime.parse(dateTimeStr);
      if (year) {
        return DateFormat('yyyy-MM-dd').format(dateTime);
      } else if (time) {
        return DateFormat('HH:mm:ss').format(dateTime);
      } else if (monthDay) {
        return DateFormat('MM-dd').format(dateTime);
      } else {
        return dateTimeStr;
      }
    } catch (e) {
      return dateTimeStr;
    }
  }

  /// type:默认返回填  1返回天 2返回小时  3返回分钟  4返回秒
  static int getTimeDifference(String time, {int? type}) {
    try {
      // time = "2024-04-27 09:23:12";
      // 当前时间
      DateTime now = DateTime.now();

      // 解析传入的日期字符串
      DateTime specificDate = DateFormat('yyyy-MM-dd HH:mm:ss').parse(time);

      // 计算时间差
      Duration difference = specificDate.difference(now);

      // 转换时间差为天、小时、分钟、秒
      int days = difference.inDays;
      int hours = difference.inHours.remainder(24);
      int minutes = difference.inMinutes.remainder(60);
      int seconds = difference.inSeconds.remainder(60);
      if (type != null) {
        if (type == 2) {
          return hours;
        } else if (type == 3) {
          return minutes;
        } else if (type == 4) {
          return seconds;
        }
      }
      return days;
    } catch (e) {
      return 0;
    }
  }

  /// 获取指定格式时间字符串
  static String formatDate(String format) {
    // 获取当前时间
    DateTime now = DateTime.now();

    // 使用输入的格式创建 DateFormat 实例
    DateFormat dateFormat = DateFormat(format);

    // 格式化当前时间
    return dateFormat.format(now);
  }

  /// 获取可变的缓存key
  static String formatCachKey() {
    /// 如果清除缓存也可以更新接口信息
    String cashKey = MySharedPref.getClearCashKey();
    if (cashKey.isEmpty) {
      MySharedPref.setClearCashKey(cashKey: formatDate("HHMMss"));
      cashKey = MySharedPref.getClearCashKey();
    }
    String appName = ToolsUtils.getAppName();
    String date = formatDate("yyyy-MM-dd");
    String model = ToolsUtils.instance.isDebugModel ? "debug" : "release";
    String allKey = "${appName}_${date}_${ToolsUtils.cacheKey}_${model}_$cashKey";
    // print("object_allKey:$allKey");
    return allKey;
  }

  /// 获取线路缓存key
  static String formatLinesCachKey() {
    String model = ToolsUtils.instance.isDebugModel ? "debug" : "release";
    String allKey = "${ToolsUtils.cacheKey}_$model";
    return allKey;
  }
}
