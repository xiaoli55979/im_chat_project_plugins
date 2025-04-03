import 'package:im_chat_common_plugin/tools/tools_utils.dart';

extension FontsizeExtension on num {
  double get bt {
    if (ToolsUtils.getIsPad()) {
      return this * 1.1;
    }
    return this * 1.0;
  }

  double get rl {
    if (ToolsUtils.getIsPad()) {
      return this * 1.3;
    }
    return this * 1.0;
  }

  /// 根据不同平台设置不同字体大小 this为基准字体
  double get pl {
    if (ToolsUtils.getIsPad()) {
      return this + 2;
    }
    return this * 1.0;
  }

  /// 宫格视图  phone:5个  pad:6个
  double get gl {
    if (ToolsUtils.getIsPad()) {
      return this + 1;
    }
    return this + 0;
  }
}
