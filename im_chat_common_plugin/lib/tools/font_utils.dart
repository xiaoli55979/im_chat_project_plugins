import 'package:im_chat_common_plugin/tools/tools_utils.dart';

class FontUtils {
  FontUtils._();

  /// 订单金额超大字体
  static double get amountMaxFont {
    if (ToolsUtils.getIsPad()) {
      return 35;
    }
    return 30;
  }

  /// 全局nav字体
  static double get navMainFont {
    if (ToolsUtils.getIsPad()) {
      return 25;
    }
    return 22;
  }

  /// 全局nav字体
  static double get navFont {
    if (ToolsUtils.getIsPad()) {
      return 19;
    }
    return 16;
  }

  /// 提示按钮字体
  static double get mainButtonFontSize {
    if (ToolsUtils.getIsPad()) {
      return 18;
    }
    return 16;
  }

  // /// 文本输入字体
  // static double getInputFontSize() {
  //   if (getIsPad()) {
  //     return 15;
  //   }
  //   return 13;
  // }

  /// 内容标题字体
  static double get contentTitleFontSize {
    if (ToolsUtils.getIsPad()) {
      return 18;
    }
    return 16;
  }

  /// 内容字体
  static double get contentFontSize {
    if (ToolsUtils.getIsPad()) {
      return 17;
    }
    return 15;
  }

  /// 内容子控件字体
  static double get contentSubFontSize {
    if (ToolsUtils.getIsPad()) {
      return 16;
    }
    return 14;
  }

  /// 获取描述字体
  static double get desFontSize {
    if (ToolsUtils.getIsPad()) {
      return 14;
    }
    return 12;
  }

  /// 获取角标字体
  static double get angleFontSize {
    if (ToolsUtils.getIsPad()) {
      return 9;
    }
    return 8;
  }
}
