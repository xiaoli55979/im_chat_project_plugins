import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/config/theme/dark_theme_colors.dart';
import 'package:im_chat_common_plugin/config/theme/light_theme_colors.dart';
import 'package:im_chat_common_plugin/tools/my_shared_pref.dart';
import 'package:im_chat_common_plugin/util/fonts.dart';

enum NavLeadingType {
  none,
  back,
  custom,
}

class BaseView extends StatefulWidget {
  const BaseView({
    super.key,
    this.scaffoldKey,
    this.hasAppBar = true,
    this.isTransparentAppBar = false,
    this.leadingType = NavLeadingType.back,
    this.leadingAction,
    this.leading,
    this.leadingWidth,
    this.titleView,
    this.title,
    this.actions,
    this.hasFlexibleSpace = false,
    this.bottom,
    this.backgroundColor,
    this.extendBodyBehindAppBar = false,
    this.resizeToAvoidBottomInset,
    this.drawer,
    this.onDrawerChanged,
    this.bottomNavigationBar,
    required this.child,
  });

  final Key? scaffoldKey;

  final bool hasAppBar;

  final bool isTransparentAppBar;

  final Widget? titleView;

  final String? title;

  final Color? backgroundColor;

  final bool extendBodyBehindAppBar;

  final bool? resizeToAvoidBottomInset;

  final Widget child;

  final double? leadingWidth;

  final NavLeadingType leadingType;

  final VoidCallback? leadingAction;

  final Widget? leading;

  final Widget? actions;

  final bool hasFlexibleSpace;

  final PreferredSize? bottom;

  final Widget? drawer;

  final Widget? bottomNavigationBar;

  final void Function(bool)? onDrawerChanged;

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  late StreamSubscription<bool> keyboardSubscription;
  var keyboardVisibilityController = KeyboardVisibilityController();

  @override
  void initState() {
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      if (visible == false) {
        FocusManager.instance.primaryFocus?.unfocus();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appBarColor = MySharedPref.getThemeIsLight() ? LightThemeColors.appBarColor : DarkThemeColors.appbarColor;
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
      appBar: widget.hasAppBar
          ? AppBar(
              elevation: 0,
              scrolledUnderElevation: 0,
              backgroundColor: widget.isTransparentAppBar
                  ? Colors.transparent
                  : appBarColor,
              leadingWidth: widget.leadingWidth,
              actions: _action(),
              title: _titleView(),
              bottom: widget.bottom,
            )
          : AppBar(
              toolbarHeight: 0,
              elevation: 0,
              scrolledUnderElevation: 0,
              backgroundColor: Colors.transparent,
            ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: widget.child,
      ),
    );
  }

  Widget? _titleView() {
    return widget.titleView ??
        (widget.title == null
            ? null
            : CommonText.instance(
                widget.title!,
                18,
                color: Colors.black,
                isTitle: true,
                fontWeight: CommonFontWeight.bold,
              ));
  }

  List<Widget> _action() {
    return widget.actions == null
        ? []
        : [
            Center(child: widget.actions!),
            SizedBox(width: 12.w),
          ];
  }
}
