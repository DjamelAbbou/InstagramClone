import 'dart:io';

import 'package:flutter/foundation.dart' show immutable;
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/state/image_upload/extensions/to_file.dart';

@immutable
class ImagePickerHelper {
  static final ImagePicker _imagePicker = ImagePicker();

  static Future<File?> pickImageFromGallery() {
    final file = _imagePicker.pickImage(source: ImageSource.gallery).toFile();
    return file;
  }

  static Future<File?> pickVideoFromGallery() {
    final file = _imagePicker.pickVideo(source: ImageSource.gallery).toFile();
    return file;
  }
}
