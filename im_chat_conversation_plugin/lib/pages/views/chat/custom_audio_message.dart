import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:http/http.dart' as http;
import 'package:im_chat_common_plugin/l10n/SlocalUtils.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';

class CustomAudioMessage extends StatefulWidget {
  final types.AudioMessage message;
  final bool isOwner;
  const CustomAudioMessage({
    super.key,
    required this.message, required this.isOwner,
  });

  @override
  _CustomAudioMessageState createState() => _CustomAudioMessageState();
}

class _CustomAudioMessageState extends State<CustomAudioMessage> {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;
  bool isBuffering = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.playerStateStream.listen((state) {
      setState(() {
        isPlaying = state.playing;
        isBuffering = state.processingState == ProcessingState.buffering || state.processingState == ProcessingState.loading;
        if (state.processingState == ProcessingState.completed) {
          isPlaying = false;
          isBuffering = false;
        }
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  // 从 waveform 中解析波形数据
  List<double> parseWaveform(String base64Waveform) {
    if (base64Waveform.isEmpty) {
      return List.filled(10, 0.5);
    }
    Uint8List decoded = base64Decode(base64Waveform);
    String decodedString = utf8.decode(decoded, allowMalformed: true);
    // print("Decoded waveform: $decodedString");

    RegExp regExp = RegExp(r'\d+');
    List<double> values = regExp.allMatches(decodedString).map((match) => double.parse(match.group(0)!)).where((v) => v < 1000).toList();

    if (values.isEmpty) {
      return List.filled(10, 0.5);
    }

    double max = values.reduce((a, b) => a > b ? a : b);
    double min = values.reduce((a, b) => a < b ? a : b);
    if (max == min) {
      return List.filled(values.length, 0.5);
    }
    return values.map((v) => (v - min) / (max - min)).toList();
  }

  // 根据波形条数计算波形区域宽度
  double getWaveformWidth(int barCount) {
    const minWidth = 60.0;
    const maxWidth = 200.0;
    const widthPerBar = 4.0;
    double width = barCount * widthPerBar;
    return width.clamp(minWidth, maxWidth);
  }

  // 估算时长文本宽度
  double getDurationTextWidth(double durationSeconds) {
    String text = "${durationSeconds.toStringAsFixed(0)}s";
    return text.length * 10.0;
  }

  // 获取本地缓存文件路径
  Future<String> _getLocalFilePath(String url) async {
    // final directory = await getTemporaryDirectory();
    // final fileName = '${url.hashCode}.m4a'; // 使用 URL 哈希作为文件名
    // return '${directory.path}/$fileName';
    print("拿出录音地址：$url");
    return url;
  }

  // 检查本地文件是否存在
  Future<File?> _checkLocalFile(String url) async {
    final filePath = await _getLocalFilePath(url);
    final file = File(filePath);
    return await file.exists() ? file : null;
  }

  // 下载音频并保存到本地
  Future<File> _downloadAudio(String url) async {
    final filePath = await _getLocalFilePath(url);
    final file = File(filePath);

    if (!await file.exists()) {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        await file.writeAsBytes(response.bodyBytes);
      } else {
        throw Exception('Failed to download audio: ${response.statusCode}');
      }
    }
    return file;
  }

  // 播放或暂停音频
  Future<void> _togglePlayPause(String audioUrl) async {
    if (isPlaying) {
      await _audioPlayer.pause();
      return;
    }

    setState(() {
      isBuffering = true;
    });

    try {
      File? localFile = await _checkLocalFile(audioUrl);
      if (localFile != null) {
        // 本地已有文件，直接播放
        await _audioPlayer.setFilePath(localFile.path);
      } else {
        // 下载并保存到本地
        localFile = await _downloadAudio(audioUrl);
        await _audioPlayer.setFilePath(localFile.path);
      }
      await _audioPlayer.play();
    } catch (e) {
      print("Error playing audio: $e");
    } finally {
      setState(() {
        isBuffering = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final metadata = widget.message.metadata ?? {};
    // final int timeTrad = metadata['timeTrad'] ?? 0;
    final int timeTrad = widget.message.duration.inSeconds;
    final String audioUrl = widget.message.uri;
    final String waveformBase64 = metadata['waveform'] ?? '';
    final List<double> waveform = parseWaveform(waveformBase64);

    return StreamBuilder<PlayerState>(
      stream: _audioPlayer.playerStateStream,
      builder: (context, playerStateSnapshot) {
        final playerState = playerStateSnapshot.data;

        return StreamBuilder<Duration?>(
          stream: _audioPlayer.durationStream,
          builder: (context, durationSnapshot) {
            final Duration? totalDuration = durationSnapshot.data;
            final double durationSeconds = timeTrad.toDouble();

            return StreamBuilder<Duration>(
              stream: _audioPlayer.positionStream,
              builder: (context, positionSnapshot) {
                final Duration position = positionSnapshot.data ?? Duration.zero;
                final double progress = durationSeconds > 0 ? position.inSeconds / durationSeconds : 0.0;

                final double waveformWidth = getWaveformWidth(waveform.length);
                final double durationTextWidth = getDurationTextWidth(durationSeconds);

                return Container(
                  color: CupertinoColors.systemGrey5,
                  child: Row(
                    children: [
                      Text(SlocalCommon.getLocalizaContent(SlocalCommon.of(context).read),
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                      SizedBox(width: 6,),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // 播放/暂停按钮
                            IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
                              icon: isBuffering
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(strokeWidth: 2),
                                    )
                                  : Icon(
                                      isPlaying ? Icons.pause : Icons.play_arrow,
                                      size: 20,
                                      color: isPlaying ? Colors.green : Colors.grey.shade600,
                                    ),
                              onPressed: () => _togglePlayPause(audioUrl),
                            ),
                            const SizedBox(width: 8),

                            // 波形区域（带进度）
                            SizedBox(
                              height: 24,
                              width: waveformWidth,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: waveform.asMap().entries.map((entry) {
                                  final int index = entry.key;
                                  final double value = entry.value;
                                  final double barProgress = waveform.isEmpty ? 0.0 : index / (waveform.length - 1);
                                  final bool isPlayed = barProgress <= progress;

                                  return Container(
                                    width: 2,
                                    height: 4 + (16 * value),
                                    decoration: BoxDecoration(
                                      color: isPlaying && isPlayed ? Colors.green : Colors.grey.shade600,
                                      borderRadius: BorderRadius.circular(1),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),

                            // 时长
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                "${durationSeconds.toStringAsFixed(0)}s",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
