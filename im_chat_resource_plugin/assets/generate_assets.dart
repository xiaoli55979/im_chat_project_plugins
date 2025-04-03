import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;

/// 资源文件生成代码
/// 有新增新的资源文件都要执行此工具,否则不生效
void main() async {
  const assetPaths = [
    'assets/images', // 图片资源文件夹路径
    'assets/sounds', // 音频资源文件夹路径
  ];

  for (final path in assetPaths) {
    final dir = Directory(path);
    if (!dir.existsSync()) {
      print('Error: $path does not exist.');
      continue;
    }

    _processDirectory(dir, path);
  }
}

void _processDirectory(Directory dir, String basePath) {
  final folders = <String, StringBuffer>{};
  final folderResourcesMap = <String, List<Map<String, String>>>{};

  for (final entity in dir.listSync(recursive: true)) {
    if (entity is File) {
      final path = entity.path;

      /// 白名单图片不处理
      if (_isSkip(path)) continue;
      final relativePath = path.replaceFirst('$basePath/', '').replaceAll('\\', '/');
      print("开始生成代码 object_relativePath:${relativePath} \n");

      if (_isImageFile(entity) || _isSvgFile(entity) || _isAudioFile(entity)) {
        final folderPath = basePath == 'assets/sounds' ? 'sounds' : _getFolderPath(relativePath);

        if (!folders.containsKey(folderPath)) {
          folders[folderPath] = StringBuffer();
          folders[folderPath]!.writeln('// 这些代码是自动生成的请勿在此修改');
          folders[folderPath]!.writeln('// 如果需要修改到assets/generate_assets.dart 修改脚本文件');
          folders[folderPath]!.writeln();
          folders[folderPath]!.writeln('import "dart:typed_data";');
          folders[folderPath]!.writeln('import "dart:convert";');
          folders[folderPath]!.writeln();
          folders[folderPath]!.writeln('class Embedded${_toClassName(folderPath)} {');

          folderResourcesMap[folderPath] = [];
        }

        final variableName = _toVariableName(relativePath);
        folderResourcesMap[folderPath]!.add({'functionName': variableName, 'fileName': relativePath});

        if (_isImageFile(entity)) {
          final encodedData = base64Encode(entity.readAsBytesSync());
          folders[folderPath]!.writeln('  // $relativePath');
          folders[folderPath]!.writeln('  static Uint8List $variableName() => base64Decode(');
          folders[folderPath]!.writeln('    """$encodedData"""');
          folders[folderPath]!.writeln('  );');
        } else if (_isSvgFile(entity)) {
          final svgContent = entity.readAsStringSync();
          folders[folderPath]!.writeln('  // $relativePath');
          folders[folderPath]!.writeln('  static String $variableName() => """$svgContent""";');
        } else if (_isAudioFile(entity)) {
          final encodedData = base64Encode(entity.readAsBytesSync());
          folders[folderPath]!.writeln('  // $relativePath');
          folders[folderPath]!.writeln('  static Uint8List $variableName() => base64Decode(');
          folders[folderPath]!.writeln('    """$encodedData"""');
          folders[folderPath]!.writeln('  );');
        }
      }
    }
  }

  // 为每个文件夹生成 Dart 文件
  folders.forEach((folderPath, buffer) {
    buffer.writeln();
    buffer.writeln('  static List<Map<String, dynamic>> getAllResources() {');
    buffer.writeln('    return [');
    for (var resource in folderResourcesMap[folderPath]!) {
      buffer.writeln('      {');
      buffer.writeln('        "functionName": "${resource['functionName']}",');
      buffer.writeln('        "fileName": "${resource['fileName']}",');
      buffer.writeln('      },');
    }
    buffer.writeln('    ];');
    buffer.writeln('  }');

    buffer.writeln();
    buffer.writeln('  static Uint8List? getResourceByName(String fileName) {');
    buffer.writeln('    switch (fileName) {');
    for (var resource in folderResourcesMap[folderPath]!) {
      buffer.writeln('      case "${resource['fileName']}":');
      buffer.writeln('        return ${resource['functionName']}();');
    }
    buffer.writeln('      default:');
    buffer.writeln('        return null;');
    buffer.writeln('    }');
    buffer.writeln('  }');

    buffer.writeln('}');

    final resourceDir = Directory('lib/resource');
    if (!resourceDir.existsSync()) {
      resourceDir.createSync(recursive: true);
    }

    final fileName = folderPath == 'sounds'
        ? 'lib/resource/sounds_embeds.dart'
        : 'lib/resource/${folderPath.replaceFirst('$basePath/', '').replaceAll('/', '_')}_embeds.dart';
    final outputFile = File(fileName);

    if (outputFile.existsSync()) {
      outputFile.deleteSync();
    }

    outputFile.writeAsStringSync(buffer.toString());
    print('生成的 Dart 文件：$fileName');
  });
}

bool _isImageFile(File file) {
  final validExtensions = ['.png', '.jpg', '.jpeg', '.webp', '.bmp'];
  final fileExtension = file.uri.pathSegments.last.toLowerCase();
  return validExtensions.any((ext) => fileExtension.endsWith(ext));
}

bool _isSvgFile(File file) {
  final fileExtension = file.uri.pathSegments.last.toLowerCase();
  return fileExtension.endsWith('.svg');
}

bool _isAudioFile(File file) {
  final validExtensions = ['.mp3', '.wav', '.ogg', '.aac', '.flac'];
  final fileExtension = file.uri.pathSegments.last.toLowerCase();
  return validExtensions.any((ext) => fileExtension.endsWith(ext));
}

String _toVariableName(String path) {
  return path.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_').toLowerCase();
}

String _getFolderPath(String relativePath) {
  final segments = relativePath.split('/');
  return segments.first; // 使用第一级目录作为文件夹名称
}

String _toClassName(String folderPath) {
  return folderPath.split('/').map((e) => e[0].toUpperCase() + e.substring(1)).join();
}

bool _isSkip(String filePath) {
  String fileName = path.basename(filePath);
  List<String> skipFiles = [
    ".DS_Store",
    "placeholder.png",
  ];
  bool skip = skipFiles.any((imageName) => fileName.contains(imageName));
  print("object_filePath:$filePath  object_fileName:$fileName  skip:$skip");
  if (skip) print("白名单,跳过\n");
  return skip;
}
