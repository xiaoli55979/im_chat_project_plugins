import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:im_chat_common_plugin/tools/tools_utils.dart';
import 'package:im_chat_conversation_plugin/pages/views/chat/tools_bar_view.dart';

/// A class that represents bottom bar widget with a text field, attachment and
/// send buttons inside. By default hides send button when text field is empty.
class CustomInput extends StatefulWidget {
  /// Creates [Input] widget.
  const CustomInput({
    super.key,
    this.isAttachmentUploading,
    this.onAttachmentPressed,
    this.onAttachmentPressedIndex,
    required this.onSendPressed,
    this.options = const InputOptions(),
    this.repliedMessage,
    this.requestFocus,
    this.focusChange = false,
  });

  /// Whether attachment is uploading. Will replace attachment button with a
  /// [CircularProgressIndicator]. Since we don't have libraries for
  /// managing media in dependencies we have no way of knowing if
  /// something is uploading so you need to set this manually.
  final bool? isAttachmentUploading;

  /// See [AttachmentButton.onPressed].
  final VoidCallback? onAttachmentPressed;
  final ValueChanged<int>? onAttachmentPressedIndex;

  /// Will be called on [SendButton] tap. Has [types.PartialText] which can
  /// be transformed to [types.TextMessage] and added to the messages list.
  final void Function(types.PartialText) onSendPressed;

  /// Customisation options for the [Input].
  final InputOptions options;

  /// The referenced message to display above the text input.
  final types.Message? repliedMessage; // 引用的消息

  /// 是否请求焦点
  final bool? requestFocus;

  /// 焦点变化
  final bool? focusChange;

  @override
  _CustomInputState createState() => _CustomInputState();
}

/// [Input] widget state.
class _CustomInputState extends State<CustomInput> {
  late final _inputFocusNode = FocusNode(
    onKeyEvent: (node, event) {
      print("object_event:$event");
      if (event.physicalKey == PhysicalKeyboardKey.enter &&
          !HardwareKeyboard.instance.physicalKeysPressed.any(
            (el) => <PhysicalKeyboardKey>{
              PhysicalKeyboardKey.shiftLeft,
              PhysicalKeyboardKey.shiftRight,
            }.contains(el),
          )) {
        if (kIsWeb && _textController.value.isComposingRangeValid) {
          return KeyEventResult.ignored;
        }
        if (event is KeyDownEvent) {
          _handleSendPressed();
        }
        return KeyEventResult.handled;
      } else {
        return KeyEventResult.ignored;
      }
    },
  );

  bool _sendButtonVisible = false;
  late TextEditingController _textController;

  /// 是否显示表情包
  bool _emojiShowing = false;

  /// 是否显示工具栏
  bool _showTools = false;

  /// 工具栏高度
  double _toolsBarHeight = 200;

  /// 焦点变化
  bool localFocusChange = false;

  @override
  void initState() {
    super.initState();
    _textController = widget.options.textEditingController ?? InputTextFieldController();
    _handleSendButtonVisibilityModeChange();
    _toolsBarHeight = ToolsUtils.getIsPad() ? 300 : 250;
  }

  void _handleSendButtonVisibilityModeChange() {
    _textController.removeListener(_handleTextControllerChange);
    if (widget.options.sendButtonVisibilityMode == SendButtonVisibilityMode.hidden) {
      _sendButtonVisible = false;
    } else if (widget.options.sendButtonVisibilityMode == SendButtonVisibilityMode.editing) {
      _sendButtonVisible = _textController.text.trim() != '';
      _textController.addListener(_handleTextControllerChange);
    } else {
      _sendButtonVisible = true;
    }
  }

  void _handleSendPressed() {
    final trimmedText = _textController.text.trim();
    if (trimmedText != '') {
      final partialText = types.PartialText(text: trimmedText, repliedMessage: widget.repliedMessage);
      widget.onSendPressed(partialText);

      if (widget.options.inputClearMode == InputClearMode.always) {
        _textController.clear();
      }
    }
  }

  void _handleTextControllerChange() {
    if (mounted) {
      setState(() {
        _sendButtonVisible = _textController.text.trim() != '';
      });
    }
  }

  Widget _buildRepliedMessage() {
    // Handle different message types using type checks
    if (widget.repliedMessage is types.TextMessage) {
      final message = widget.repliedMessage as types.TextMessage;
      return ListTile(
        title: Text(
          '回复:${message.text}',
          style: TextStyle(color: Colors.black),
          maxLines: 3,
        ),
      );
    } else {
      return Container();
    }
    // else if (widget.repliedMessage is types.ImageMessage) {
    //   final message = widget.repliedMessage as types.ImageMessage;
    //   return ListTile(
    //     title: Text('Replied with an image'),
    //     subtitle: Text(
    //       'Image URL: ${message.uri}',
    //       style: TextStyle(color: Colors.white70),
    //     ),
    //   );
    // } else if (widget.repliedMessage is types.FileMessage) {
    //   final message = widget.repliedMessage as types.FileMessage;
    //   return ListTile(
    //     title: Text('Replied with a file'),
    //     subtitle: Text(
    //       'File name: ${message.name}',
    //       style: TextStyle(color: Colors.white70),
    //     ),
    //   );
    // } else {
    //   return ListTile(
    //     title: Text(
    //       'Replied message is of unsupported type',
    //       style: TextStyle(color: Colors.white70),
    //     ),
    //   );
    // }
  }

  /// 留言客服用户信息输入框
  Widget _leaveView() {
    final List<Map<String, String>> fields = [
      {'title': '用户名', 'hint': '请输入您的账号'},
      {'title': '邮    箱', 'hint': '请输入您的邮箱'},
    ];

    return Container(
      color: Color(0xFFF5F5F5),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRow(fields[0]["title"] ?? '', fields[0]["hint"] ?? ''),
            SizedBox(height: 20),
            _buildRow(fields[1]["title"] ?? '', fields[1]["hint"] ?? ''),
          ],
        ),
      ),
    );
  }

  // Helper method to create each row with a label and a text field
  Widget _buildRow(String title, String hintText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 15),
        Expanded(
          child: Container(
            color: Colors.white,
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0), // Adjust vertical padding
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _inputBuilder() {
    final query = MediaQuery.of(context);
    final buttonPadding = EdgeInsets.only(left: 10, right: 10, bottom: 10);
    final safeAreaInsets = EdgeInsets.only(bottom: 5);
    final textPadding = EdgeInsets.fromLTRB(widget.onAttachmentPressedIndex != null ? 0 : 24, 0, _sendButtonVisible ? 0 : 24, 0);

    /// 点击聊天背景关闭工具栏
    if (localFocusChange != widget.focusChange) {
      _showTools = false;
      _emojiShowing = false;
      localFocusChange = widget.focusChange!;
      if (mounted) {
        setState(() {});
      }
    }

    return Focus(
      autofocus: !widget.options.autofocus,
      child: Padding(
        padding: EdgeInsets.only(left: 0, right: 0, bottom: 0),
        child: Material(
          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(15),
          //   topRight: Radius.circular(15),
          // ),
          color: Color(0xFFF5F5F5),
          // surfaceTintColor: Colors.grey,
          elevation: 0,
          child: SafeArea(
              child: Container(
            padding: safeAreaInsets,
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                // 显示引用消息
                if (widget.repliedMessage != null) _buildRepliedMessage(),
                Row(
                  textDirection: TextDirection.ltr,
                  children: [

                    Expanded(
                      child: Padding(
                        padding: textPadding,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12), // 设置圆角
                          ),
                          child: TextField(
                            enabled: widget.options.enabled,
                            autocorrect: widget.options.autocorrect,
                            autofocus: widget.options.autofocus,
                            enableSuggestions: widget.options.enableSuggestions,
                            controller: _textController,
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent), // Hides the underline (bottom border)
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent), // Hides the underline when focused
                              ),
                              contentPadding: EdgeInsets.only(left: 16.0),
                              hintText: "",
                            ),
                            focusNode: _inputFocusNode,
                            keyboardType: widget.options.keyboardType,
                            maxLines: 5,
                            minLines: 1,
                            onChanged: widget.options.onTextChanged,
                            onTap: () {
                              widget.options.onTextFieldTap?.call();
                              _emojiShowing = false;
                              _showTools = false;
                              if (mounted) {
                                setState(() {});
                              }
                            },
                            style: const TextStyle(color: Colors.black, fontSize: 18),
                            textCapitalization: TextCapitalization.sentences,
                          ),
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        if (mounted) {
                          setState(() {
                            _emojiShowing = !_emojiShowing;
                            _showTools = false;
                            _inputFocusNode.unfocus();
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.emoji_emotions_outlined,
                        // color: Colors.white,
                      ),
                    ),

                    Visibility(
                      visible: !_sendButtonVisible,
                      child: AttachmentButton(
                        isLoading: widget.isAttachmentUploading ?? false,
                        onPressed: () {
                          _showTools = !_showTools;
                          _emojiShowing = false;
                          _inputFocusNode.unfocus();
                          if (mounted) {
                            setState(() {});
                          }
                        },
                        padding: buttonPadding,
                      ),
                    ),

                    ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: buttonPadding.bottom + buttonPadding.top + 24,
                      ),
                      child: Visibility(
                        visible: _sendButtonVisible,
                        child: SendButton(
                          onPressed: _handleSendPressed,
                          padding: buttonPadding,
                        ),
                      ),
                    ),
                  ],
                ),
                Offstage(
                  offstage: !_showTools,
                  child: SingleChildScrollView(
                    child: ToolsBarView(
                      toolList: [
                        // ToolType.order,
                        ToolType.image,
                        ToolType.carmera,
                        ToolType.video,
                        ToolType.file,
                        ToolType.card,
                        ToolType.sign
                        // ToolType.system,
                        // ToolType.richText,
                        // ToolType.model,
                        // ToolType.source,
                      ],
                      height: _toolsBarHeight,
                      onItemPressed: (int index) {
                        if (widget.onAttachmentPressedIndex != null) {
                          widget.onAttachmentPressedIndex!(index);
                        }
                      },
                    ),
                  ),
                ),
                Offstage(
                  offstage: !_emojiShowing,
                  child: EmojiPicker(
                    textEditingController: _textController,
                    // scrollController: _scrollController,
                    config: Config(
                      height: 350,
                      checkPlatformCompatibility: true,
                      viewOrderConfig: const ViewOrderConfig(),
                      emojiViewConfig: EmojiViewConfig(
                        // Issue: https://github.com/flutter/flutter/issues/28894
                        emojiSizeMax: 28 * (foundation.defaultTargetPlatform == TargetPlatform.iOS ? 1.2 : 1.0),
                      ),
                      skinToneConfig: const SkinToneConfig(),
                      categoryViewConfig: const CategoryViewConfig(),
                      bottomActionBarConfig: BottomActionBarConfig(
                        showBackspaceButton: false,
                        showSearchViewButton: false,
                      ),
                      searchViewConfig: const SearchViewConfig(),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant CustomInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.options.sendButtonVisibilityMode != oldWidget.options.sendButtonVisibilityMode) {
      _handleSendButtonVisibilityModeChange();
    }
    if (widget.requestFocus != null && widget.requestFocus!) {
      _inputFocusNode.requestFocus();
    }
  }

  @override
  void dispose() {
    _inputFocusNode.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              _inputFocusNode.requestFocus();
              if (mounted) {
                setState(() {});
              }
            },
            child: _inputBuilder(),
          ),
        ],
      );
}
