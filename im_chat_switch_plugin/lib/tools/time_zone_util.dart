class TimeZoneUtil {
  // 获取当前时区的名称
  static String getCurrentTimeZone() {
    final String timeZoneName = DateTime.now().timeZoneName;
    return timeZoneName;
  }

  // 获取当前时区的偏移量（单位：小时）
  static int getCurrentTimeZoneOffset() {
    final int timeZoneOffset = DateTime.now().timeZoneOffset.inHours;
    return timeZoneOffset;
  }

  // 获取当前时区的详细信息
  static String getCurrentTimeZoneDetails() {
    final String timeZoneName = getCurrentTimeZone();
    final int timeZoneOffset = getCurrentTimeZoneOffset();
    String result = '当前时区: $timeZoneName, 偏移: UTC${timeZoneOffset >= 0 ? '+' : ''}$timeZoneOffset';
    // print("object_re:$result");
    return result;
  }

// 是否支持的时区
  static bool supportTimeZone({bool appStoreBuild = true, int timeZone = 1}) {
    // getCurrentTimeZoneDetails();
    int timeZone = TimeZoneUtil.getCurrentTimeZoneOffset();
    if ((timeZone - 8).abs() > timeZone && appStoreBuild) {
      return false;
    }
    return true;
  }
}
