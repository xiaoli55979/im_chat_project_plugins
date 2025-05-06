import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:http/http.dart' as http;
import 'package:im_chat_common_plugin/jtp_common_init.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';

import '../handle/message_content_type.dart';
import '../pages/views/chat/tools_bar_view.dart';

class ChatSendMessageTools {
  /// 工具栏快捷入口
  void handleToolsPressed(int index, {
    required types.User user,
    Function(types.Message message)? onMessageCreated,
  }) {
    if (index == ToolType.image.value) {
      ChatSendMessageTools().handleImageSelection(
        user: user,
        onMessageCreated: (types.ImageMessage message) {
          if (onMessageCreated != null) {
            onMessageCreated(message);
          }
        },
      );
    } else if (index == ToolType.carmera.value) {
      ChatSendMessageTools().handleCameraSelection(user: user,
        onMessageCreated: (types.ImageMessage message) {
          if (onMessageCreated != null) {
            onMessageCreated(message);
          }
        },
      );
    } else if (index == ToolType.video.value) {
      ChatSendMessageTools().handleVideoSelection(
        user: user,
        onMessageCreated: (types.VideoMessage message) {
          if (onMessageCreated != null) {
            onMessageCreated(message);
          }
        },
      );
    } else if (index == ToolType.file.value) {
      ChatSendMessageTools().handleFileSelection(
        user: user,
        onMessageCreated: (types.FileMessage message) {
          if (onMessageCreated != null) {
            onMessageCreated(message);
          }
        },
      );
    } else if (index == ToolType.card.value) {
      ChatSendMessageTools().handleCardSelection(user: user,
        onMessageCreated: (types.CustomMessage message) {
          if (onMessageCreated != null) {
            onMessageCreated(message);
          }
        },
      );
    } else if (index == ToolType.sign.value) {
      ChatSendMessageTools().handleSignSelection(user: user,
        onMessageCreated: (types.CustomMessage message) {
          if (onMessageCreated != null) {
            onMessageCreated(message);
          }
        },
      );
    }
  }

  /// 发送图片消息
  void handleImageSelection({
    required types.User user,
    Function(types.ImageMessage message)? onMessageCreated,
  }) async {
    final result = await ImagePicker().pickImage(
        imageQuality: 70, maxWidth: 1440, source: ImageSource.gallery);

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: user,
        createdAt: DateTime
            .now()
            .millisecondsSinceEpoch,
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
        height: image.height.toDouble(),
        status: types.Status.sending,
      );

      // 触发回调
      if (onMessageCreated != null) {
        onMessageCreated(message);
      }

      // /// 开始上传
      // MessageHandle.sendImageMessage(
      //     result: result,
      //     api: api,
      //     channelId: channelID,
      //     onStateChanged: (UploadState state) {
      //       if (state.status == UploadStatus.failure) {
      //         final updatedMessage = message.copyWith(
      //           status: Status.error, // 使用 copyWith 方法更新状态
      //         );
      //
      //         // 更新消息列表中的状态
      //         _updateMessage(updatedMessage);
      //       }
      //     });
    }
  }

  /// 发送相机拍摄图片消息
  void handleCameraSelection({
    required types.User user,
    Function(types.ImageMessage message)? onMessageCreated,
  }) async {
    final result = await ImagePicker().pickImage(
        imageQuality: 70, maxWidth: 1440, source: ImageSource.camera);

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: user,
        createdAt: DateTime
            .now()
            .millisecondsSinceEpoch,
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
        height: image.height.toDouble(),
        status: types.Status.sending,
      );

      // 触发回调
      if (onMessageCreated != null) {
        onMessageCreated(message);
      }

      // /// 开始上传
      // MessageHandle.sendImageMessage(
      //     result: result,
      //     api: api,
      //     channelId: channelID,
      //     onStateChanged: (UploadState state) {
      //       if (state.status == UploadStatus.failure) {
      //         final updatedMessage = message.copyWith(
      //           status: Status.error, // 使用 copyWith 方法更新状态
      //         );
      //
      //         // 更新消息列表中的状态
      //         _updateMessage(updatedMessage);
      //       }
      //     });
    }
  }

  /// 发送视频消息
  void handleVideoSelection({
    required types.User user,
    Function(types.VideoMessage message)? onMessageCreated,
  }) async {
    JtpComponentsInit jtpInit = JtpComponentsInit();

    /// 防止挂起锁屏
    jtpInit.isLockScreen = true;
    final result = await ImagePicker().pickVideo(
        maxDuration: const Duration(seconds: 60), // 设置最大录制时长,
        source: ImageSource.camera);

    if (result != null) {
      final file = File(result.path);
      final videoFileSize = await file.length();

      // 构造 VideoMessage
      final message = types.VideoMessage(
        author: user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        name: result.name,
        size: videoFileSize,
        uri: result.path,
        status: types.Status.sending,
      );

      // 触发回调
      /// 触发回调
      if (onMessageCreated != null) {
        onMessageCreated(message);
      }

      jtpInit.isLockScreen = false;
      // /// 开始上传
      // MessageHandle.sendVideoMessage(
      //   result: result,
      //   videoController: videoController,
      //   api: api,
      //   channelId: channelID,
      //   onStateChanged: (UploadState state) {
      //     if (state.status == UploadStatus.failure) {
      //       final updatedMessage = message.copyWith(
      //         status: Status.error, // 使用 copyWith 方法更新状态
      //       );
      //
      //       // 更新消息列表中的状态
      //       _updateMessage(updatedMessage);
      //     }
      //   },
      // );
    }
  }

  /// 选择并发送文件消息
  void handleFileSelection({
    required types.User user,
    Function(types.FileMessage message)? onMessageCreated,
  }) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: user,
        createdAt: DateTime
            .now()
            .millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
        status: Status.sending,
      );

      /// 触发回调
      if (onMessageCreated != null) {
        onMessageCreated(message);
      }

      // /// 发送消息
      // MessageHandle.sendFileMessage(
      //   result: result,
      //   api: api,
      //   channelId: channelID,
      //   onStateChanged: (UploadState state) {
      //     if (state.status == UploadStatus.failure) {
      //       final updatedMessage = message.copyWith(
      //         status: Status.error, // 使用 copyWith 方法更新状态
      //       );
      //       // 更新消息列表中的状态
      //       _updateMessage(updatedMessage);
      //     }
      //   },
      // );
    }
  }

  /// 打开文件
  static Future<void> openFileMessage(types.FileMessage message,
      List<types.Message> listMessages,
      VoidCallback? callback,) async {
    JtpComponentsInit jtpInit = JtpComponentsInit();
    jtpInit.isLockScreen = true;
    var localPath = message.uri;
    final documentsDir = (await getApplicationDocumentsDirectory()).path;
    final cachedFilePath = '$documentsDir/${message.name}';

    // 检查缓存是否存在
    if (File(cachedFilePath).existsSync()) {
      // 如果缓存文件存在，直接用缓存文件路径
      localPath = cachedFilePath;
    } else if (message.uri.startsWith('http')) {
      // 如果缓存不存在并且是网络文件，则下载
      try {
        final index = listMessages.indexWhere((element) =>
        element.id == message.id);
        final updatedMessage = (listMessages[index] as types.FileMessage)
            .copyWith(
          isLoading: true,
        );
        listMessages[index] = updatedMessage;
        callback?.call();

        final client = http.Client();
        final request = await client.get(Uri.parse(message.uri));
        final bytes = request.bodyBytes;

        // 保存文件到缓存路径
        final file = File(cachedFilePath);
        await file.writeAsBytes(bytes);
        localPath = cachedFilePath;
      } finally {
        // 更新消息状态
        final index = listMessages.indexWhere((element) =>
        element.id == message.id);
        final updatedMessage = (listMessages[index] as types.FileMessage)
            .copyWith(
          isLoading: null,
        );
        listMessages[index] = updatedMessage;
        callback?.call();
      }
    }

    // 打开文件
    await OpenFilex.open(localPath);
    jtpInit.isLockScreen = false;
  }

  /// 发送名片消息
  void handleCardSelection({
    required types.User user,
    Function(types.CustomMessage message)? onMessageCreated,
  }) async {
    final message = types.CustomMessage(
      author: user,
      createdAt: DateTime
          .now()
          .millisecondsSinceEpoch,
      metadata: {
        'type': MessageContentType.CARD, // 自定义元数据，表示这是一个名片类型消息
        'name': '招商总局(官方)',
        'avatar': 'https://example.com/avatar.jpg', // 头像图片链接
      },
      status: types.Status.sending,
      id: '${DateTime
          .now()
          .millisecondsSinceEpoch}',
    );

    // 触发回调
    if (onMessageCreated != null) {
      onMessageCreated(message);
    }
  }

  /// 发送签到消息
  void handleSignSelection({
    required types.User user,
    Function(types.CustomMessage message)? onMessageCreated,
  }) async {
    final message = types.CustomMessage(
      author: user,
      createdAt: DateTime
          .now()
          .millisecondsSinceEpoch,
      metadata: {
        'type': MessageContentType.SIGN, // 自定义元数据，表示这是一个签到类型消息
        'continueDays': '2',
        'total':"5"
      },
      status: types.Status.sending,
      id: '${DateTime
          .now()
          .millisecondsSinceEpoch}',
    );

    // 触发回调
    if (onMessageCreated != null) {
      onMessageCreated(message);
    }
  }
}
