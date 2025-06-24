import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:im_chat_common_plugin/config/color/colors.dart';
import 'package:im_chat_common_plugin/util/asset_util.dart';
import 'package:im_chat_common_plugin/util/fonts.dart';
import 'package:im_chat_common_plugin/widget/button/common_button.dart';
import 'package:im_chat_resource_plugin/generated/assets.dart';

// 搜索框
class CommonSearchBar extends StatefulWidget {
  CommonSearchBar({
    super.key,
    this.text,
    this.textStyle,
    this.hintText,
    this.hintTextStyle,
    this.controller,
    this.prefixWidget,
    this.suffixWidget,
    this.onChanged,
    this.onCancel,
    this.onSearch,
    this.textFieldDecoration,
    this.showCleanButton = true,
    this.showSearchIcon = true,
    this.decoration,
    this.padding,
    this.textFieldPadding,
    this.enabled = true,
    this.onTap,
  });

  final TextEditingController? controller;

  /// 搜索框文字
  String? text;
  final TextStyle? textStyle;

  ///提示文字
  final String? hintText;
  final TextStyle? hintTextStyle;

  /// 外部内间距
  final EdgeInsetsGeometry? padding;
  /// 外部样式
  final Decoration? decoration;
  /// 输入框内间距
  final EdgeInsetsGeometry? textFieldPadding;
  /// 输入框样式
  final Decoration? textFieldDecoration;
  /// 是否显示清除按钮 默认true
  final bool showCleanButton;
  /// 是否显示搜索按钮
  final bool showSearchIcon;
  /// 前置布局
  final Widget? prefixWidget;
  /// 后置布局
  final Widget? suffixWidget;

  /// 内容变化
  final ValueChanged<String>? onChanged;

  /// 点击清空按钮
  final GestureTapCallback? onCancel;

  /// 点击搜索按钮或者点击键盘（搜索）
  final ValueChanged<String>? onSearch;

  final bool enabled;

  final GestureTapCallback? onTap;

  @override
  State<CommonSearchBar> createState() => _CommonSearchBarState();
}

class _CommonSearchBarState extends State<CommonSearchBar> {

  final double _fontSize = 16.sp;

  bool _showCleanButton = false;

  late final TextEditingController _controller = TextEditingController();

  TextEditingController get _getController => widget.controller ?? _controller;

  @override
  void initState() {
    super.initState();
    _getController.text = widget.text ?? "";
    _getController.addListener(
      () {
        String newValue = _getController.text;
        if (newValue.isNotEmpty && _showCleanButton == false) {
          setState(() {
            _showCleanButton = true;
          });
        } else if (newValue.isEmpty && _showCleanButton == true) {
          setState(() {
            _showCleanButton = false;
          });
        }
        widget.text = newValue;
        if (widget.onChanged != null) {
          widget.onChanged!(newValue);
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widget.decoration,
      padding: widget.padding ?? EdgeInsets.all(16.0.w),
      child: Row(
        children: [
          widget.prefixWidget ?? Container(),
          Expanded(
            child: GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
                if (!widget.enabled && widget.onTap != null) {
                  widget.onTap!();
                }
              },
              child: Container(
                padding: widget.textFieldPadding ?? EdgeInsets.all(12.w),
                decoration: widget.textFieldDecoration ??
                    BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.h),
                    ),
                child: Row(
                  children: [
                    if(widget.showSearchIcon)
                      ...[
                        GestureDetector(
                          onTap: () {
                            _onSearch(_getController.text);
                          },
                          child: AssetUtil.asset(Assets.commonIconSearch, width: 16.w, height: 16.w),
                        ),
                        SizedBox(width: 8.w),
                      ],
                    Expanded(
                      child: _getTextFormField(),
                    ),
                    SizedBox(width: 10.w),
                    if(_showCleanButton & widget.showCleanButton)
                      CommonButton(
                        padding: EdgeInsets.zero,
                        minSize: 16.w,
                        child: Icon(Icons.cancel, color: Colors.grey, size: 16.w),
                        onPressed: () {
                          setState(() {
                            _getController.clear();
                            _showCleanButton = false;
                          });
                          if (widget.onCancel != null) {
                            widget.onCancel!();
                          }
                        },
                      ),
                    widget.suffixWidget ?? Container(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField _getTextFormField() {
    _showCleanButton = _getController.text.isNotEmpty;

    return TextFormField(
      enabled: widget.enabled,
      selectionControls: MaterialTextSelectionControls(),
      maxLines: 1,
      style: _getTextStyle(),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          isCollapsed: true,
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: _getHintTextStyle(),
          hintMaxLines: 1
      ),
      controller: _getController,
      onFieldSubmitted: _onSearch,
    );
  }

  _onSearch(String? text) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (widget.onSearch != null) {
      widget.onSearch!(text ?? "");
    }
  }

  _getTextStyle() {
    return widget.textStyle ?? CommonTextStyle.instance(_fontSize, color: IMColors.normalTextColor);
  }

  _getHintTextStyle() {
    return widget.hintTextStyle ?? CommonTextStyle.instance(_fontSize, color: IMColors.hintTextColor);
  }
}
