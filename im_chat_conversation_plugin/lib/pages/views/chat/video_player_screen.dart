import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerScreen({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _isPlaying = false;
  bool _isBuffering = false;
  bool _showDurationBar = true;
  Timer? _hideBarTimer;

  double _scale = 1.0; // 当前缩放比例
  double _baseScale = 1.0; // 初始缩放比例
  Offset _offset = Offset.zero; // 当前偏移
  Offset _baseOffset = Offset.zero; // 初始偏移

  @override
  void initState() {
    super.initState();
    _initializeController();
    _startHideBarTimer();
  }

  Future<void> _initializeController() async {
    try {
      String filePath = widget.videoUrl;

      if (filePath.startsWith('file://')) {
        filePath = filePath.replaceFirst('file://', '');
      }

      if (filePath.startsWith('http://') || filePath.startsWith('https://')) {
        _controller = VideoPlayerController.network(filePath);
      } else {
        final file = File(filePath);
        if (!file.existsSync()) {
          throw Exception("Video file does not exist at path: $filePath");
        }
        _controller = VideoPlayerController.file(file);
      }

      await _controller.initialize();

      if (mounted) {
        setState(() {
          _isInitialized = true;
          _isPlaying = _controller.value.isPlaying;
        });
      }

      _controller.addListener(_videoPlayerListener);
      _controller.play();
    } catch (e) {
      print("Error initializing video player: $e");
    }
  }

  void _videoPlayerListener() {
    if (_controller.value.isPlaying != _isPlaying) {
      _isPlaying = _controller.value.isPlaying;
    }
    if (_controller.value.isBuffering != _isBuffering) {
      _isBuffering = _controller.value.isBuffering;
    }

    if (mounted) {
      setState(() {});
    }
  }

  void _startHideBarTimer() {
    _hideBarTimer?.cancel();
    _hideBarTimer = Timer(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _showDurationBar = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_videoPlayerListener);
    _controller.dispose();
    _hideBarTimer?.cancel();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String minutes = twoDigits(duration.inMinutes);
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            if (mounted) {
              setState(() {
                _showDurationBar = !_showDurationBar;
                if (_showDurationBar) {
                  _startHideBarTimer();
                }
              });
            }
          },
          onScaleStart: (details) {
            _baseScale = _scale;
            _baseOffset = _offset;
          },
          onScaleUpdate: (details) {
            if (mounted) {
              setState(() {
                _scale = (_baseScale * details.scale).clamp(1.0, 3.0);
                if (_scale > 1.0) {
                  _offset = _baseOffset + details.focalPointDelta;
                } else {
                  _offset = Offset.zero;
                }
              });
            }
          },
          child: Center(
            child: _isInitialized
                ? LayoutBuilder(
                    builder: (context, constraints) {
                      return Stack(
                        children: [
                          // 渲染视频
                          Transform.translate(
                            offset: _offset,
                            child: Transform.scale(
                              scale: _scale,
                              child: AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: VideoPlayer(_controller),
                              ),
                            ),
                          ),
                          // 关闭按钮
                          if (_showDurationBar)
                            Positioned(
                              top: 20,
                              right: 20,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.7),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                          // 进度条
                          if (_showDurationBar)
                            Positioned(
                              bottom: 10,
                              left: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black.withOpacity(0.0),
                                      Colors.black.withOpacity(0.7),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        _isPlaying ? Icons.pause : Icons.play_arrow,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      onPressed: () {
                                        if (mounted) {
                                          setState(() {
                                            if (_isPlaying) {
                                              _controller.pause();
                                            } else {
                                              _controller.play();
                                            }
                                            _isPlaying = !_isPlaying;
                                            _startHideBarTimer();
                                          });
                                        }
                                      },
                                    ),
                                    Text(
                                      _formatDuration(_controller.value.position),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Expanded(
                                      child: VideoProgressIndicator(
                                        _controller,
                                        allowScrubbing: true,
                                        padding: const EdgeInsets.symmetric(horizontal: 20),
                                      ),
                                    ),
                                    Text(
                                      _formatDuration(_controller.value.duration),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  )
                : const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
