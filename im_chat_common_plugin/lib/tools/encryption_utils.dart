import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:encrypt/encrypt.dart';
import 'package:im_chat_common_plugin/tools/project_utils.dart';
import 'package:im_chat_common_plugin/tools/tools_utils.dart';
import 'package:pointycastle/asymmetric/api.dart';

class EncryptionUtil {
  static String __getpl() {
    return 'LS0tLS1CRUdJTiBQVUJMSUMgS0VZLS0tLS0KTUlHZk1BMEdDU3FHU0liM0RRRUJBUVVBQTRHTkFEQ0JpUUtCZ1FES3pITU1QM1ZjL1RUMFhqbEtrVXlzZEUzOApySHp1VXRxbXMrQjFUSFlKOExZQldIL3JHOWxxSndic1dvNzg2ZTNGdDhuMTQrS3lsbUhSelVDaVEwWTRETW9aCnNHR1NVUG1DdGtwR3NsMnQvSTM0bVBuU0ZnSnJDd1Y2ZkZQbDZmS2VEeUJ1VWs3d05Bb2tIdzBYTzd6RFdPVjEKSTVjVk5QQ2NzNUY5UzZOMWtRSURBUUFCCi0tLS0tRU5EIFBVQkxJQyBLRVktLS0tLQo=';
  }

  static String __getpt() {
    return 'LS0tLS1CRUdJTiBQUklWQVRFIEtFWS0tLS0tCk1JSUNkd0lCQURBTkJna3Foa2lHOXcwQkFRRUZBQVNDQW1Fd2dnSmRBZ0VBQW9HQkFNck1jd3cvZFZ6OU5QUmUKT1VxUlRLeDBUZnlzZk81UzJxYXo0SFZNZGdud3RnRllmK3NiMldvbkJ1eGFqdnpwN2NXM3lmWGo0cktXWWRITgpRS0pEUmpnTXlobXdZWkpRK1lLMlNrYXlYYTM4amZpWStkSVdBbXNMQlhwOFUrWHA4cDRQSUc1U1R2QTBDaVFmCkRSYzd2TU5ZNVhVamx4VTA4Snl6a1gxTG8zV1JBZ01CQUFFQ2dZQjVSU1VQRCt1SXZjbXF6NldHMTdoMzc5eXEKMmlLakNWekREeEdNVXpySzJ1eWJoV2FKRzFBNTBEaXRvY0dicisrRnFrL1ZBSDhSdUNlcXBBaWdmNFkrOGJRMApkREZOS3FDTGZxN1dRUTRvb0I0V0xXcU4zeVlmcnFsREE2WDkxdng5cStzbGcyNkNHV0pnU1lHZUNXcFJQODNtCk9waE45ZDhjem1oV1IyRTVlUUpCQU9VR1NKNHo2eEtCZS9wczc3bEdQNnpPWkVDd3BmcU1sbFZkNDR4VnpwWTkKRkF3Ni9ONEF6cXhxODhTNXBGdmxFQVFubUdLRU9oRm5xTEcvWW1FSUlCc0NRUURpcjJIM3FLeGcvTCtUaE9MMQozL3lzbC9DT3lWQnFaWGY0NUVvbXIvRTVieVNaL3Q3YVo1SWJsb0RLeGZNUjlMWnAyTEpiUWhGVVZrOTgvN3d6ClF4UERBa0VBMUkwVFlqZi9COHJDWERVeityaFdxak5XV2E5WUs0TEVsdSt2R25RY2FkUy93V1lSZnB3ek0xT0QKYjJWM1E0NEFZa3E1STExaVl2cllWamF2d0N3QlZ3SkJBSUdUcXpaOExuMEtQU0JBTjlSQWd4ak5pVzYxV01oWQoxQ2xycFk5VHgxb0RWRExLNCt5SWc1Wk5nN1ZsVGJxWDNhWEhmcngzbVp4UjhnSUwxVEtnUnkwQ1FFWEJRd1U4CkF1c1hyYlk3RXBFQi83RGVudHBkK3hSRmgrWHlmcEVLZlRjMDA1WTV4cFRLcGdKWFFhTVc5QVV1SkZnVFFYUkEKT1pmYmlMRnl2dHRjYkZNPQotLS0tLUVORCBQUklWQVRFIEtFWS0tLS0tCg==';
  }

  /// 私钥解密
  static String rsaDecryption(String data) {
    final encrypter = Encrypter(RSA(privateKey: RSAKeyParser().parse(dcyppt(__getpt())) as RSAPrivateKey));
    Uint8List sourceBytes = base64.decode(data);
    int inputLen = sourceBytes.length;
    int maxLen = 128;
    List<int> totalBytes = [];
    for (var i = 0; i < inputLen; i += maxLen) {
      int endLen = inputLen - i;
      Uint8List item;
      if (endLen > maxLen) {
        item = sourceBytes.sublist(i, i + maxLen);
      } else {
        item = sourceBytes.sublist(i, i + endLen);
      }
      totalBytes.addAll(encrypter.decryptBytes(Encrypted(item)));
    }
    return utf8.decode(totalBytes);
  }

  /// 加密方法，接收消息和没有 BEGIN/END 的 Base64 公钥
  static String rsaEncryption2(String message) {
    try {
      List<int> sourceBytes = utf8.encode(message);
      // 手动为公钥添加 PEM 格式头尾
      String pemPublicKey = '-----BEGIN PUBLIC KEY-----\n${ToolsUtils.instance.prKy}\n-----END PUBLIC KEY-----';

      // 使用 RSAKeyParser 解析 PEM 格式的公钥
      final publicKey = RSAKeyParser().parse(pemPublicKey) as RSAPublicKey;
      final encrypter = Encrypter(RSA(publicKey: publicKey as RSAPublicKey));

      int inputLen = sourceBytes.length;
      // 加密最大长度
      int maxLen = 117;
      // 存放加密后的字节数组
      List<int> totalBytes = [];
      // 分段加密 步长为117
      for (var i = 0; i < inputLen; i += maxLen) {
        // 还剩多少字节长度
        int endLen = inputLen - i;
        List<int> item;
        if (endLen > maxLen) {
          item = sourceBytes.sublist(i, i + maxLen);
        } else {
          item = sourceBytes.sublist(i, i + endLen);
        }
        // 加密后的对象转换成字节数组再存放到容器
        totalBytes.addAll(encrypter.encryptBytes(item).bytes);
      }
      return base64.encode(totalBytes);
    } catch (e) {
      return "";
    }
  }

  /// 公钥加密
  static String rsaEncryption(String data) {
    List<int> sourceBytes = utf8.encode(data);
    final encrypter = Encrypter(RSA(publicKey: RSAKeyParser().parse(dcyppt(__getpl())) as RSAPublicKey));

    int inputLen = sourceBytes.length;
    // 加密最大长度
    int maxLen = 117;
    // 存放加密后的字节数组
    List<int> totalBytes = [];
    // 分段加密 步长为117
    for (var i = 0; i < inputLen; i += maxLen) {
      // 还剩多少字节长度
      int endLen = inputLen - i;
      List<int> item;
      if (endLen > maxLen) {
        item = sourceBytes.sublist(i, i + maxLen);
      } else {
        item = sourceBytes.sublist(i, i + endLen);
      }
      // 加密后的对象转换成字节数组再存放到容器
      totalBytes.addAll(encrypter.encryptBytes(item).bytes);
    }
    return base64.encode(totalBytes);
  }

  // 加密
  static String encryptBase64(String str) {
    var base64String = base64Encode(utf8.encode(str)).toString();
    return base64String;
  }

  static String dcyppt(String base64String) {
    base64String = String.fromCharCodes(base64Decode(base64String));
    return base64String;
  }

  static String __getKo({required int index}) {
    List<String> list = [];
    ProjectType type = ProjectUtils.projectType;
    if (type == ProjectType.iChat) {
      list = [
        'MXJiNGF1aHg4a2t3UmxWNlpncVBoUjNjY0hVTXYwVEk=',
        'MEdZM3V6VE9UeWNjZkVkTENJbDVYcnNxbExGbUFUR1o=',
        'eGxMQ0hGM1FrSEVwU2VYUUVrbEZWVEJsc2Z5emhGdG8='
      ];
    }
    return list[index];
  }

  /// 生成随机 AES 秘钥
  static String generateAESKey({int length = 32}) {
    if (ToolsUtils.instance.aeKy.isNotEmpty) {
      return ToolsUtils.instance.aeKy;
    }
    const String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    Random random = Random.secure();
    String key = List.generate(length, (index) => chars[random.nextInt(chars.length)]).join('');
    key = encryptBase64(key);
    ToolsUtils.instance.aeKy = key;
    return key;
  }

  static String getDnsAk() {
    String keyStr = dcyppt(__getKo(index: 0));
    return keyStr;
  }

  static String acdecOld(String encryptedStr, String? ivStr, {required int index}) {
    try {
      ivStr ?? "pokjued902318903";
      String keyStr = getDnsAk();
      final key = encrypt.Key.fromUtf8(keyStr);
      final iv = encrypt.IV.fromUtf8(ivStr!);
      final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));

      final decrypted = encrypter.decrypt64(encryptedStr, iv: iv);
      return decrypted;
    } catch (e) {
      return "decrypt error";
    }
  }

  static String acdec(String encryptedStr, String? ivStr, {required int index}) {
    try {
      ivStr ?? "pokjued902318903";
      String keyStr = dcyppt(generateAESKey());
      final key = encrypt.Key.fromUtf8(keyStr);
      final iv = encrypt.IV.fromUtf8(ivStr!);
      final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));

      final decrypted = encrypter.decrypt64(encryptedStr, iv: iv);
      return decrypted;
    } catch (e) {
      return "";
    }
  }

  static String deacdec(String encryptedStr, String? ivStr, {required int index}) {
    try {
      ivStr ?? "pokjued902318903";
      String keyStr = dcyppt(generateAESKey());
      final key = encrypt.Key.fromUtf8(keyStr);
      final iv = encrypt.IV.fromUtf8(ivStr!);
      final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
      final encrypted = encrypter.encrypt(encryptedStr, iv: iv);
      return encrypted.base64;
    } catch (e) {
      return "";
    }
  }
}
