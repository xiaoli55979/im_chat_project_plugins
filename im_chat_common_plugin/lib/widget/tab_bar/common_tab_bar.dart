import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:im_chat_common_plugin/config/color/colors.dart';
import 'package:im_chat_common_plugin/util/fonts.dart';
import 'package:im_chat_common_plugin/widget/tab_bar/custom_tab_indicator.dart';

abstract class TabBarItem {
  String get tabText;
}

///公共tabbar组件
class CommonTabBar extends StatelessWidget {
  const CommonTabBar({
    super.key,
    required this.tabs,
    this.tabController,
    this.isScrollable = false,
    this.padding,
    this.labelPadding,
    this.selectedTextStyle,
    this.unselectedTextStyle,
    this.tabBuilder,
  });

  final List<TabBarItem> tabs;

  final TabController? tabController;

  ///是否可滑动
  final bool isScrollable;

  final EdgeInsetsGeometry? padding;

  final EdgeInsetsGeometry? labelPadding;

  final TextStyle? selectedTextStyle;

  final TextStyle? unselectedTextStyle;

  final Widget Function(int index)? tabBuilder;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 12.w),
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      tabAlignment: isScrollable ? TabAlignment.start : null,
      isScrollable: isScrollable,
      dividerColor: Colors.transparent,
      dividerHeight: 0,
      indicatorWeight: 0,
      indicator: CustomTabIndicator(),
      labelPadding: labelPadding,
      labelStyle: _getSelectedStyle(),
      unselectedLabelStyle: _getUnSelectedStyle(),
      tabs: List.generate(tabs.length, (index) {
        return Center(
          child: tabBuilder != null
              ? tabBuilder!(index)
              : Text(
                  tabs[index].tabText,
                ),
        );
      }),
    );
  }

  _getSelectedStyle() {
    return selectedTextStyle ??
        CommonTextStyle.instance(18.sp, fontWeight: CommonFontWeight.medium);
  }

  _getUnSelectedStyle() {
    return unselectedTextStyle ??
        CommonTextStyle.instance(15.sp, color: IMColors.hintTextColor);
  }
}
