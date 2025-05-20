import 'dart:async';
import 'dart:io';
import 'package:im_chat_common_plugin/models/response/result.dart';
import 'package:image_picker/image_picker.dart';

class PictureManager {
  static final shared = PictureManager();
  final ImagePicker picker = ImagePicker();

  Future<Result<File?, Error>> getImage({
    ImageSource source = ImageSource.camera,
  }) async {
    try {
      final XFile? image = await picker.pickImage(source: source);
      if (image != null) {
        return Result.succss(File(image.path));
      }
      return Result.succss(null);
    } catch (e) {
      return Result.failure((e is Error) ? e : Error());
    }
  }
}
