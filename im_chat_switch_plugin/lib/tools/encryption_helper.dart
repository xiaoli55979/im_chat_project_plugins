import 'dart:convert';

class EncryptionHelper {
// 编码为 Base64
  String encode(String plainText) {
    final bytes = utf8.encode(plainText); // 转换为字节
    return base64.encode(bytes); // 编码为 Base64 字符串
  }

  // 解码 Base64
  String decode(String base64String) {
    final bytes = base64.decode(base64String); // 解码为字节
    return utf8.decode(bytes); // 转换为原始字符串
  }
}
