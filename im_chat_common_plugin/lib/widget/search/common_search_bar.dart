import 'package:flutter/material.dart';
import 'package:im_chat_common_plugin/util/fonts.dart';
import 'package:im_chat_common_plugin/widget/button/common_button.dart';

enum SearchIconDirectional {
  left,
  right,
}

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
    this.decoration,
    this.padding,
    this.textFieldPadding,
  });

  final TextEditingController? controller;

  final EdgeInsetsGeometry? padding;

  /// 搜索框文字
  String? text;
  final TextStyle? textStyle;

  ///提示文字
  final String? hintText;
  final TextStyle? hintTextStyle;

  final Decoration? decoration;
  final EdgeInsetsGeometry? textFieldPadding;
  final Decoration? textFieldDecoration;
  final bool showCleanButton;
  final Widget? prefixWidget;
  final Widget? suffixWidget;

  /// 内容变化
  final ValueChanged<String>? onChanged;

  /// 点击清空按钮
  final GestureTapCallback? onCancel;

  /// 点击搜索按钮或者点击键盘（搜索）
  final ValueChanged<String>? onSearch;

  @override
  State<CommonSearchBar> createState() => _CommonSearchBarState();
}

class _CommonSearchBarState extends State<CommonSearchBar> {
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

  final double _fontSize = 16;
  final double _cleanButtonSize = 16;
  final double _cleanButtonSpacing = 5;

  TextFormField _getTextFormField() {
    _showCleanButton = _getController.text.isNotEmpty;

    return TextFormField(
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
    return widget.textStyle ?? CommonTextStyle.instance(_fontSize, color: Colors.black87);
  }

  _getHintTextStyle() {
    return widget.hintTextStyle ?? CommonTextStyle.instance(_fontSize, color: Colors.grey);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widget.decoration,
      padding: widget.padding ?? const EdgeInsets.all(16.0),
      child: Row(
        children: [
          widget.prefixWidget ?? Container(),
          Expanded(
            child: Container(
              padding: widget.textFieldPadding ?? const EdgeInsets.all(12),
              decoration: widget.textFieldDecoration ??
                  BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _onSearch(_getController.text);
                    },
                    child: const Icon(Icons.search, color: Colors.grey),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _getTextFormField(),
                  ),
                  const SizedBox(width: 10),
                  CommonButton(
                    padding: EdgeInsets.zero,
                    minSize: 16,
                    child: const Icon(Icons.cancel, color: Colors.grey, size: 16),
                    onPressed: () {
                      setState(() {
                        _getController.clear();
                        _showCleanButton = false;
                      });
                      if (widget.onCancel != null) {
                        widget.onCancel!();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
          widget.suffixWidget ?? Container(),
        ],
      ),
    );
  }
}
