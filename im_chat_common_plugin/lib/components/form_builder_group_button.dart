import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:group_button/group_button.dart';
import 'package:shimmer/shimmer.dart';

/// ButtonGroup与表单结合
class FormBuilderGroupButton extends FormBuilderFieldDecoration<int?> {
  final bool loading;
  final bool showShimmer;
  final bool showDecoration;
  final List buttons;
  final Set<int> _disabledIndexes;
  final GroupButtonOptions? options;
  final GroupButtonIndexedBuilder? buttonIndexedBuilder;
  final GroupButtonController? controller;
  final Widget? loadingWidget;

  FormBuilderGroupButton({
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
    List<int> disabledIndexes = const [],
    this.showDecoration = false,
    this.showShimmer = false,
    this.loading = false,
    this.loadingWidget,
    required this.buttons,
    this.options,
    this.buttonIndexedBuilder,
    this.controller,
  })  : _disabledIndexes = disabledIndexes.toSet(),
        super(builder: (FormFieldState<int?> field) {
          final state = field as FormBuilderGroupButtonState;
          var child = showShimmer && loading
              ? Shimmer.fromColors(baseColor: Colors.grey.shade300, highlightColor: Colors.grey.shade100, child: loadingWidget ?? Container())
              : GroupButton(
                  isRadio: true,
                  buttons: buttons,
                  options: options ?? const GroupButtonOptions(),
                  controller: state.controller,
                  buttonIndexedBuilder: buttonIndexedBuilder,
                );
          return showDecoration
              ? InputDecorator(
                  decoration: state.decoration,
                  child: child,
                )
              : child;
        });

  @override
  FormBuilderGroupButtonState createState() => FormBuilderGroupButtonState();
}

class FormBuilderGroupButtonState<T> extends FormBuilderFieldDecorationState<FormBuilderGroupButton, int?> {
  late GroupButtonController controller;

  @override
  void didChange(int? value) {
    super.didChange(value);

    if (value != null) {
      if (controller.selectedIndex != value) {
        controller.selectIndex(value);
      }
    } else if (controller.selectedIndex != null) {
      controller.unselectAll();
    }
  }

  @override
  void didUpdateWidget(FormBuilderField<int?> oldWidget) {
    super.didUpdateWidget(oldWidget);

    /// 判断是否有修改
    if (!setEquals(widget._disabledIndexes, controller.disabledIndexes)) {
      /// 等父组件构建完成再构建子组件
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.disableIndexes(widget._disabledIndexes.toList());
      });
    }
  }

  @override
  void dispose() {
    /// 移除监听器
    controller.removeListener(_onControllerChanged);

    /// 释放资源
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? GroupButtonController();

    /// 设置默认值
    if (value != null) {
      controller.selectIndex(value ?? 0);
    }

    if (widget._disabledIndexes.isNotEmpty) {
      controller.disableIndexes(widget._disabledIndexes.toList());
    }

    /// 监听索引变化
    controller.addListener(_onControllerChanged);
  }

  void _onControllerChanged() {
    if (mounted) {
      didChange(controller.selectedIndex);
    }
  }
}
