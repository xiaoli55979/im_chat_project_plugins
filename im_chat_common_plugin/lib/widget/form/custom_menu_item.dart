import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:im_chat_common_plugin/config/icon/iconfont.dart';
import 'package:im_chat_common_plugin/util/fonts.dart';
import 'package:im_chat_common_plugin/widget/button/common_button.dart';
enum CustomMenuItemType {
  edit,
  choose,
}

class CustomMenuItem extends StatefulWidget {
  CustomMenuItem({
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
    this.showCleanButton = false,
    this.subTitleTextAlign = TextAlign.right,
    this.type = CustomMenuItemType.edit,
    this.direction = Axis.horizontal,
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
  final CustomMenuItemType type;
  final int? subTitleMaxLines;

  /// type == XCTextFormFieldType.choose，输入框始终不能输入，enabled无效
  final bool? enabled;
  final bool showCleanButton;

  final Axis direction;
  final TextAlign subTitleTextAlign;

  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  final Widget? prefixWidget;
  final Widget? suffixWidget;

  final Widget? arrowWidget;

  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;

  @override
  State<CustomMenuItem> createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {
  bool _showCleanButton = false;
  late final TextEditingController _controller = TextEditingController();

  TextEditingController get _getController => widget.controller ?? _controller;

  @override
  void initState() {
    super.initState();
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
  final double _fontSize = 14.sp;
  final double _cleanButtonSize = 20.w;
  final double _cleanButtonSpacing = 4.w;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        if ((widget.type == CustomMenuItemType.choose || (widget.type == CustomMenuItemType.edit && !(widget.enabled ?? false))) && widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: Container(
        padding: widget.padding,
        child: widget.direction == Axis.horizontal
            ? Row(
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
                  widget.suffixWidget ?? Container(),
                  _getSelectArrow(),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  widget.prefixWidget ?? Container(),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _getTitleWidget(),
                        SizedBox(
                          height: _spacing(),
                        ),
                        _getSubTitleWidget(),
                      ],
                    ),
                  ),
                  widget.suffixWidget ?? Container(),
                  _getSelectArrow(),
                ],
              ),
      ),
    );
  }

  _getTitleWidget() {
    return Text(widget.title ?? '', style: _getTitleTextStyle());
  }

  _getSelectArrow() {
    return widget.type == CustomMenuItemType.choose
        ? Container(
            margin: EdgeInsets.only(
              left: _cleanButtonSpacing,
            ),
            child: widget.arrowWidget ?? const Icon(Icons.chevron_right, color: Colors.grey),
          )
        : Container();
  }

  _getSubTitleWidget() {
    return widget.type == CustomMenuItemType.choose || widget.enabled == false
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
        widget.enabled == true && widget.type == CustomMenuItemType.edit;
    _showCleanButton = _getController.text.isNotEmpty && enabled == true;

    return TextField(
      controller: _getController,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      selectionControls: MaterialTextSelectionControls(),
      maxLines: widget.subTitleMaxLines,
      enabled: enabled,
      textAlign: widget.subTitleTextAlign,
      style: _getSubTitleTextStyle(),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          isCollapsed: true,
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: _getHintTextStyle(),
          hintMaxLines: 1,
          suffixIconConstraints: BoxConstraints(
              maxWidth: _cleanButtonSize + _cleanButtonSpacing * 2,
              maxHeight: _cleanButtonSize),
          suffixIcon: _showCleanButton & widget.showCleanButton == false
              ? null
              : CommonButton(
                  padding: EdgeInsets.zero,
                  minSize: 16,
                  child: const Icon(Icons.cancel, color: Colors.grey, size: 16),
                  onPressed: () {
                    setState(() {
                      _getController.clear();
                      _showCleanButton = false;
                    });
                  },
                )),
    );
  }

  _getTitleTextStyle() {
    return widget.titleStyle ?? CommonTextStyle.instance(_fontSize, color: widget.enabled == true ? Colors.black87 : Colors.grey);
  }

  _getSubTitleTextStyle() {
    return widget.subTitleStyle ??
        CommonTextStyle.instance(_fontSize, color: widget.enabled == true ? Colors.black87 : Colors.grey);
  }

  _getHintTextStyle() {
    return widget.hintTextStyle ?? CommonTextStyle.instance(_fontSize, color: Colors.grey);
  }
}
