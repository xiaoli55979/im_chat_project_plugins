import 'dart:convert';
import 'dart:io';

/// 多语言加密脚本
void main() {
  // 配置
  String operation = 'decode'; // 可以修改为 'encode' 或 'decode'
  String filePattern = '_language.dart';
  Directory currentDir = Directory(Platform.script.toFilePath()).parent;

  print('Current directory: ${currentDir.path}');

  // 遍历目录下的 Dart 文件
  currentDir.listSync().whereType<File>().forEach((file) {
    if (file.path.endsWith(filePattern)) {
      print('Processing file: ${file.path}');
      try {
        String content = file.readAsStringSync();
        print('File content:\n$content');

        // 查找 language 映射
        RegExp regExp = RegExp(
          r'static\s+Map<String,\s+String>\s+language\s+=\s+\{([\s\S]*?)\};',
          multiLine: true,
        );
        Match? match = regExp.firstMatch(content);

        if (match != null) {
          String languageMapContent = match.group(1)!;
          print('Language map found:\n$languageMapContent');

          // 处理语言值
          Map<String, String> updatedLanguage = _processLanguageMap(languageMapContent, operation);
          print('Processed language map: $updatedLanguage');

          // 构造新的映射内容
          String updatedMapContent = updatedLanguage.entries.map((entry) {
            return '    ${entry.key}: ${entry.value},';
          }).join('\n');
          String updatedContent = content.replaceFirst(
            regExp,
            'static Map<String, String> language = {\n$updatedMapContent\n  };',
          );

          // 写回文件
          file.writeAsStringSync(updatedContent, flush: true);
          print('Updated file: ${file.path}');
        } else {
          print('No language map found in ${file.path}');
        }
      } catch (e, stackTrace) {
        print('Error processing file ${file.path}: $e\n$stackTrace');
      }
    } else {
      print('Skipping file: ${file.path}');
    }
  });
}

Map<String, String> _processLanguageMap(String languageMapContent, String operation) {
  Map<String, String> languageMap = {};

  // 匹配键值对，支持空值
  RegExp keyValueRegExp = RegExp(r"(\w+):\s*'([^']*)'");

  Iterable<Match> matches = keyValueRegExp.allMatches(languageMapContent);

  print('Found ${matches.length} key-value pairs.');

  for (var match in matches) {
    String key = match.group(1)!;
    String value = match.group(2)!;

    print('Processing key: $key, value: $value');

    // 根据操作选择处理方式
    String updatedValue = '';
    switch (operation) {
      case 'encode':
        updatedValue = _encode(value);
        print('Encoded value for $key: $updatedValue');
        break;
      case 'decode':
        updatedValue = _decode(value);
        print('Decoded value for $key: $updatedValue');
        break;
      default:
        print('Unknown operation: $operation');
        return languageMap;
    }

    languageMap[key] = updatedValue;
  }

  if (matches.isEmpty) {
    print('Warning: No valid key-value pairs found in language map.');
  }

  return languageMap;
}

// Base64 编码
String _encode(String value) {
  print('Encoding value: $value');
  String encoded = base64Encode(utf8.encode(value));
  return "'$encoded'";
}

// Base64 解码
String _decode(String value) {
  print('Decoding value: $value');
  try {
    if (RegExp(r'^[A-Za-z0-9+/=]+$').hasMatch(value)) {
      String decodedValue = utf8.decode(base64Decode(value));
      return "'$decodedValue'";
    } else {
      print('Value is not a valid Base64 string: $value');
      return "'$value'";
    }
  } catch (e) {
    print('Error decoding value: $value, error: $e');
    return "'$value'";
  }
}
