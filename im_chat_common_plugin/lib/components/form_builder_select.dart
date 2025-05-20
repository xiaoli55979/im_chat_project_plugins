import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:im_chat_common_plugin/tools/dialog_utils.dart';
import 'package:im_chat_common_plugin/tools/font_utils.dart';

import 'empty_view.dart';

/// 表单底部选择项
class FormBuilderSelect<T> extends FormBuilderFieldDecoration<T> {
  final List<T> data;
  final String placeholder;
  final String addButtonText;
  final String title;
  final String emptyText;
  final bool Function()? beforeTap;
  final Function()? addTap;
  final Widget Function(BuildContext, T) buildView;

  FormBuilderSelect({
    super.key,
    required super.name,
    super.validator,
    super.initialValue,
    super.decoration = const InputDecoration(),
    super.onChanged,
    super.valueTransformer,
    super.enabled = true,
    super.onSaved,
    super.autovalidateMode = AutovalidateMode.disabled,
    super.onReset,
    super.focusNode,
    required this.data,
    required this.buildView,
    this.beforeTap,
    this.addTap,
    this.title = "请选择收款方式",
    this.emptyText = "无可用收款方式",
    this.placeholder = "您没有收款方式，点击添加",
    this.addButtonText = "添加新的收款方式",
  }) : super(builder: (FormFieldState<T?> field) {
          final state = field as FormBuilderSelectState;
          var theme = Theme.of(state.context);
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.h),
                border: Border.all(
                  color: state.value == null ? Colors.grey : theme.primaryColor,
                )),
            child: ListTile(
              onTap: state.enabled ? state.onBottomSheet : null,
              title: state.value == null
                  ? Text(
                      placeholder,
                      style: TextStyle(
                        fontSize: FontUtils.contentTitleFontSize,
                      ),
                    )
                  : buildView(state.context, state.value),
              trailing: const Icon(Icons.chevron_right),
            ),
          );
        });

  @override
  FormBuilderSelectState<T> createState() => FormBuilderSelectState<T>();
}

class FormBuilderSelectState<T> extends FormBuilderFieldDecorationState<FormBuilderSelect<T>, T> {
  /// 显示底部选择菜单
  onBottomSheet() {
    /// 检查是否登录
    if (widget.beforeTap != null && widget.beforeTap!.call() == false) {
      return;
    }

    DialogUtils.bottomSheet(
        builder: (c) => Container(
              decoration: const BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))),
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20).r,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(fontSize: FontUtils.contentTitleFontSize),
                  ),
                  Flexible(
                    child: widget.data.isEmpty
                        ? EmptyView(text: widget.emptyText)
                        : ListView.builder(
                            padding: const EdgeInsets.only(top: 0, bottom: 0),
                            shrinkWrap: true,
                            itemCount: widget.data.length,
                            itemBuilder: (c, i) => Column(
                              children: [
                                ListTile(
                                    onTap: () {
                                      DialogUtils.back();
                                      didChange(widget.data[i]);
                                    },
                                    title: widget.buildView(c, widget.data[i])),
                                const Divider(
                                  height: 1,
                                ),
                              ],
                            ),
                          ),
                  ),
                  Row(
                    children: [
                      TextButton.icon(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            DialogUtils.back();
                            widget.addTap?.call();
                          },
                          label: Text(
                            widget.addButtonText,
                            style: TextStyle(
                              fontSize: FontUtils.contentTitleFontSize,
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ));
  }

  @override
  void initState() {
    super.initState();
  }
}
