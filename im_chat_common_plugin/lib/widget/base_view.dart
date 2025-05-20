import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/config/color/colors.dart';
import 'package:im_chat_common_plugin/config/theme/app_theme.dart';
import 'package:im_chat_common_plugin/util/asset_util.dart';
import 'package:im_chat_common_plugin/util/fonts.dart';
import 'package:im_chat_common_plugin/util/storage.dart';
import 'package:im_chat_common_plugin/widget/button/common_button.dart';
import 'package:im_chat_resource_plugin/generated/assets.dart';

enum NavLeadingType {
  none,
  back,
  custom,
}

class BaseView extends StatefulWidget {
  BaseView({
    super.key,
    this.scaffoldKey,
    this.hasAppBar = true,
    this.isTransparentAppBar = false,
    this.toolbarHeight = kToolbarHeight,
    this.leadingType = NavLeadingType.back,
    this.leadingAction,
    this.leading,
    this.leadingWidth,
    this.backIconColor,
    this.titleView,
    this.title,
    this.titleColor,
    this.actions,
    this.hasFlexibleSpace = false,
    this.bottom,
    this.backgroundColor,
    this.extendBodyBehindAppBar = false,
    this.resizeToAvoidBottomInset,
    this.drawer,
    this.onDrawerChanged,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.systemOverlayStyle,
    this.flexibleSpace,
    required this.child,
    Color? appBarColor,
  }) : appBarColor = appBarColor ?? IMColors.appBarColor;

  final Key? scaffoldKey;

  final bool hasAppBar;

  final bool isTransparentAppBar;

  final double toolbarHeight;

  final Color appBarColor;

  final Widget? titleView;

  final String? title;

  final Color? titleColor;

  final Color? backgroundColor;

  final bool extendBodyBehindAppBar;

  final bool? resizeToAvoidBottomInset;

  final Widget child;

  final double? leadingWidth;

  final NavLeadingType leadingType;

  final VoidCallback? leadingAction;

  final Widget? leading;

  final Color? backIconColor;

  final Widget? actions;

  final bool hasFlexibleSpace;

  final PreferredSize? bottom;

  final Widget? drawer;

  final Widget? bottomNavigationBar;

  final Widget? floatingActionButton;

  final FloatingActionButtonLocation? floatingActionButtonLocation;

  final Widget? flexibleSpace;

  final SystemUiOverlayStyle? systemOverlayStyle;

  final void Function(bool)? onDrawerChanged;

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  double scrollOffset = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      onDrawerChanged: (isOpen) {
        if (widget.onDrawerChanged != null) {
          widget.onDrawerChanged!(isOpen);
        }
      },
      key: widget.scaffoldKey,
      drawer: widget.drawer,
      backgroundColor: widget.backgroundColor,
      extendBodyBehindAppBar: widget.hasAppBar && !widget.isTransparentAppBar
          ? widget.extendBodyBehindAppBar
          : true,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      bottomNavigationBar: widget.bottomNavigationBar,
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      appBar: widget.hasAppBar
          ? AppBar(
              elevation: 0,
              scrolledUnderElevation: 0,
              toolbarHeight: widget.toolbarHeight,
              backgroundColor: widget.isTransparentAppBar ? Colors.transparent : IMColors.appBarColor,
              leadingWidth: widget.leadingWidth,
              leading: _leading(),
              actions: _action(),
              title: _titleView(),
              centerTitle: true,
              bottom: widget.bottom,
              flexibleSpace: widget.flexibleSpace,
              systemOverlayStyle: widget.systemOverlayStyle ?? AppTheme.getNormalSystemOverlayStyle(Storage.getIsLightTheme()),
            )
          : AppBar(
              toolbarHeight: 0,
              elevation: 0,
              scrolledUnderElevation: 0,
              backgroundColor: Colors.transparent,
              systemOverlayStyle: widget.systemOverlayStyle ?? AppTheme.getNormalSystemOverlayStyle(Storage.getIsLightTheme()),
            ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: widget.child,
      ),
    );
  }

  Widget? _leading() {
    switch (widget.leadingType) {
      case NavLeadingType.none:
        return const SizedBox();
      case NavLeadingType.back:

        ///todo 替换返回图标
        return CommonButton(
          minSize: 24.h,
          onPressed: widget.leadingAction ?? Get.back,
          child: AssetUtil.asset(
            Assets.commonNavBack,
            color: widget.backIconColor ?? IMColors.black,
            width: 30.w,
            height: 30.w,
          ),
        );
      case NavLeadingType.custom:
        return widget.leading;
    }
  }

  Widget? _titleView() {
    return widget.titleView ??
        (widget.title == null
            ? null
            : CommonText.instance(
                widget.title!,
                18.sp,
                color: widget.titleColor ?? IMColors.appBarTextColor,
                isTitle: true,
                fontWeight: CommonFontWeight.bold,
              ));
  }

  List<Widget> _action() {
    return widget.actions == null
        ? []
        : [
            Center(child: widget.actions!),
            SizedBox(width: 14.w),
          ];
  }
}
