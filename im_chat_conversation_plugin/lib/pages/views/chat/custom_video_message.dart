import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:im_chat_conversation_plugin/pages/views/chat/video_player_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class CustomVideoMessage extends StatefulWidget {
  final types.VideoMessage message;
  final double maxThumbnailHeight; // 视频缩略图最大高度
  final double maxThumbnailWidth; // 视频缩略图最大宽度
  const CustomVideoMessage({
    Key? key,
    required this.message,
    this.maxThumbnailHeight = 250,
    this.maxThumbnailWidth = 250,
  }) : super(key: key);

  @override
  _CustomVideoMessageState createState() => _CustomVideoMessageState();
}

class _CustomVideoMessageState extends State<CustomVideoMessage> with AutomaticKeepAliveClientMixin {
  String? _thumbnailPath;
  bool _isThumbnailLoading = true;

  @override
  void initState() {
    super.initState();
    _loadThumbnail();
  }

  Future<void> _loadThumbnail() async {
    try {
      final directory = await getTemporaryDirectory();
      final thumbnailName = "${widget.message.uri.hashCode}.jpg";
      final thumbnailPath = "${directory.path}/$thumbnailName";

      if (File(thumbnailPath).existsSync()) {
        if (mounted) {
          setState(() {
            _thumbnailPath = thumbnailPath;
            _isThumbnailLoading = false;
          });
        }
        return;
      }

      final thumbnail = await VideoThumbnail.thumbnailFile(
        video: widget.message.uri,
        thumbnailPath: thumbnailPath,
        imageFormat: ImageFormat.JPEG,
        maxHeight: 750,
        quality: 95,
      );

      if (thumbnail != null && File(thumbnail).existsSync()) {
        if (mounted) {
          setState(() {
            _thumbnailPath = thumbnail;
            _isThumbnailLoading = false;
          });
        }
      } else {
        print("Failed to generate thumbnail.");
        if (mounted) {
          setState(() {
            _isThumbnailLoading = false;
          });
        }
      }
    } catch (e) {
      print("Error loading thumbnail: $e");
      if (mounted) {
        setState(() {
          _isThumbnailLoading = false;
        });
      }
    }
  }

  /// 根据视频的宽高比计算缩放后的宽高
  Size _calculateScaledSize(double originalWidth, double originalHeight) {
    double maxHeight = widget.maxThumbnailHeight;
    double maxWidth = widget.maxThumbnailWidth;

    if (originalWidth > originalHeight) {
      // 横屏视频：以最大宽度为基准
      if (originalWidth > maxWidth) {
        double scaleFactor = maxWidth / originalWidth;
        return Size(maxWidth, originalHeight * scaleFactor);
      }
    } else {
      // 竖屏视频：以最大高度为基准
      if (originalHeight > maxHeight) {
        double scaleFactor = maxHeight / originalHeight;
        return Size(originalWidth * scaleFactor, maxHeight);
      }
    }

    return Size(originalWidth, originalHeight);
  }

  @override
  bool get wantKeepAlive => true; // 保持组件状态

  @override
  Widget build(BuildContext context) {
    super.build(context); // 必须调用以保持状态

    double width = widget.message.width?.toDouble() ?? 400;
    double height = widget.message.height?.toDouble() ?? 400;
    final Size scaledSize = _calculateScaledSize(width, height);

    return GestureDetector(
      onTap: _showVideoPlayer,
      child: _isThumbnailLoading
          ? Container(
              width: scaledSize.width,
              height: scaledSize.height,
              color: Colors.grey[300], // 占位背景颜色
              child: const Center(
                child: CircularProgressIndicator(strokeWidth: 1.5),
              ),
            )
          : _thumbnailPath != null
              ? SizedBox(
                  width: scaledSize.width,
                  height: scaledSize.height,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.file(
                        File(_thumbnailPath!),
                        fit: BoxFit.cover,
                        width: scaledSize.width,
                        height: scaledSize.height,
                      ),
                      Center(
                        child: Container(
                          width: 40,
                          height: 40,
                          margin: EdgeInsets.zero,
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.9), // 边框颜色
                              width: 1.0, // 边框宽度
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white.withValues(alpha: 0.9),
                            size: 25,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : Container(
                  width: scaledSize.width,
                  height: scaledSize.height,
                  color: Colors.grey[300],
                  child: Icon(Icons.play_circle_fill, color: Colors.white, size: 44),
                ),
    );
  }

  void _showVideoPlayer() {
    showDialog(
      context: context,
      useSafeArea: false,
      builder: (BuildContext context) {
        final size = MediaQuery.of(context).size;
        return Dialog(
          backgroundColor: Colors.black,
          insetPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: VideoPlayerScreen(videoUrl: widget.message.uri),
          ),
        );
      },
    );
  }
}
