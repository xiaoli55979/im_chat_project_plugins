import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:im_chat_common_plugin/config/color/colors.dart';
import 'package:im_chat_common_plugin/util/asset_util.dart';
import 'package:im_chat_common_plugin/util/fonts.dart';
import 'package:im_chat_common_plugin/widget/button/common_button.dart';
import 'package:im_chat_resource_plugin/generated/assets.dart';

enum MultiMenuItemType {
  edit,
  choose,
}

class MultiMenuItem extends StatefulWidget {
  MultiMenuItem({
    super.key,
    this.title,
    this.titleStyle,
    this.subTitle,
    this.subTitleStyle,
    this.hintText,
    this.hintTextStyle,
    this.controller,
    this.spacing,
    this.padding,
    this.subTitleMaxLines = 1,
    this.enabled = true,
    this.prefixWidget,
    this.suffixWidget,
    this.arrowWidget,
    this.onChanged,
    this.onTap,
    this.keyboardType,
    this.inputFormatters,
    this.showPwdText = false,
    this.showCleanButton = false,
    this.subTitleTextAlign = TextAlign.right,
    this.type = MultiMenuItemType.edit,
    this.direction = Axis.horizontal,
    this.decoration,
    this.height,
  });

  final TextEditingController? controller;

  /// 标题文字，左或上
  final String? title;
  final TextStyle? titleStyle;

  /// 子标题文字（内容），右或下
  String? subTitle;
  final TextStyle? subTitleStyle;

  ///提示文字
  final String? hintText;
  final TextStyle? hintTextStyle;

  /// title和subTitle间距，默认水平24，垂直4
  final double? spacing;

  final EdgeInsetsGeometry? padding;

  /// 显示类型
  final MultiMenuItemType type;
  final int? subTitleMaxLines;

  final bool? enabled;
  final bool showCleanButton;
  ///是否使用明文/密文功能
  final bool showPwdText;

  final Axis direction;
  final TextAlign subTitleTextAlign;
  final Decoration? decoration;
  final double? height;

  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  final Widget? prefixWidget;
  final Widget? suffixWidget;

  final Widget? arrowWidget;

  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;

  @override
  State<MultiMenuItem> createState() => _MultiMenuItemState();
}

class _MultiMenuItemState extends State<MultiMenuItem> {
  bool _showCleanButton = false;
  bool _obscureText = false;

  late final TextEditingController _controller = TextEditingController();

  TextEditingController get _getController => widget.controller ?? _controller;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.showPwdText;
    _getController.text = widget.subTitle ?? "";
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
        widget.subTitle = newValue;
        if (widget.onChanged != null) {
          widget.onChanged!(newValue);
        }
      },
    );
  }

  @override
  void dispose() {
    _getController.dispose();
    super.dispose();
  }

  double _spacing() =>
      widget.spacing ?? (widget.direction == Axis.horizontal ? 8.w : 4.w);
  final double _fontSize = 16.sp;
  final double _cleanButtonSpacing = 4.w;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        if ((widget.type == MultiMenuItemType.choose || (widget.type == MultiMenuItemType.edit && !(widget.enabled ?? false))) && widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: widget.direction == Axis.horizontal
          ? Container(
              height: widget.height,
              padding: widget.padding ?? EdgeInsets.symmetric(vertical: 16.h),
              decoration: widget.decoration ?? BoxDecoration(borderRadius: BorderRadius.circular(8), color: IMColors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.prefixWidget ?? Container(),
                  _getTitleWidget(),
                  SizedBox(
                    width: _spacing(),
                  ),
                  Expanded(
                    child: _getSubTitleWidget(),
                  ),
                  _getCleanButton(),
                  _getPwdButton(),
                  widget.suffixWidget ?? Container(),
                  _getSelectArrow(),
                ],
              ))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _getTitleWidget(),
                SizedBox(
                  height: _spacing(),
                ),
                Container(
                  height: widget.height,
                  padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
                  decoration:  widget.decoration ?? BoxDecoration(borderRadius: BorderRadius.circular(8), color: IMColors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.prefixWidget ?? Container(),
                      Expanded(
                        child: _getSubTitleWidget(),
                      ),
                      _getCleanButton(),
                      _getPwdButton(),
                      widget.suffixWidget ?? Container(),
                      _getSelectArrow(),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  _getCleanButton() {
    return _showCleanButton && widget.showCleanButton
        ? CommonButton(
            padding: EdgeInsets.only(left: 10.w),
            minSize: 16.w,
            child: Icon(Icons.cancel, color: Colors.grey, size: 16.w),
            onPressed: () {
              setState(() {
                _getController.clear();
                _showCleanButton = false;
              });
            },
          )
        : Container();
  }

  _getPwdButton() {
    return widget.showPwdText
        ? CommonButton(
            padding: EdgeInsets.only(left: 10.w),
            minSize: 16,
            child: AssetUtil.asset(
                _obscureText
                    ? Assets.commonIconVisibilityOff
                    : Assets.commonIconVisibility,
                width: 16.w,
                height: 16.h),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          )
        : Container();
  }

  _getTitleWidget() {
    return Text(widget.title ?? '', style: _getTitleTextStyle());
  }

  _getSelectArrow() {
    return widget.type == MultiMenuItemType.choose
        ? Container(
            margin: EdgeInsets.only(
              left: _cleanButtonSpacing,
            ),
            child: widget.arrowWidget ?? AssetUtil.asset(Assets.commonIconRightArrow, width: 13.w, height: 13.w, fit: BoxFit.cover),
          )
        : Container();
  }

  _getSubTitleWidget() {
    return widget.type == MultiMenuItemType.choose || widget.enabled == false
        ? Text(
            (widget.subTitle ?? widget.hintText) ?? "",
            overflow: TextOverflow.ellipsis,
            maxLines: widget.subTitleMaxLines,
            textAlign: widget.subTitleTextAlign,
            style: widget.subTitle != null
                ? _getSubTitleTextStyle()
                : _getHintTextStyle(),
          )
        : _getTextField();
  }

  _getTextField() {
    bool enabled =
        widget.enabled == true && widget.type == MultiMenuItemType.edit;
    _showCleanButton = _getController.text.isNotEmpty && enabled == true;

    return TextField(
      controller: _getController,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      selectionControls: MaterialTextSelectionControls(),
      maxLines: widget.subTitleMaxLines,
      enabled: enabled,
      obscureText: _obscureText,
      textAlign: widget.subTitleTextAlign,
      style: _getSubTitleTextStyle(),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          isCollapsed: true,
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: _getHintTextStyle(),
          hintMaxLines: 1),
    );
  }

  _getTitleTextStyle() {
    return widget.titleStyle ??
        CommonTextStyle.instance(_fontSize,
            color: widget.enabled == true ? IMColors.normalTextColor : Colors.grey);
  }

  _getSubTitleTextStyle() {
    return widget.subTitleStyle ??
        CommonTextStyle.instance(_fontSize,
            color: widget.enabled == true ? IMColors.normalTextColor : Colors.grey);
  }

  _getHintTextStyle() {
    return widget.hintTextStyle ??
        CommonTextStyle.instance(_fontSize, color: IMColors.hintTextColor);
  }
}
