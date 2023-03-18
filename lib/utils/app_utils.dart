// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:image_picker/image_picker.dart';

class AppUtils {
  Future<File?> pickImage(ImageSource source) async {
    final _image = await ImagePicker().pickImage(source: source);
    if (_image == null) {
      return null;
    } else {
      final image = File(_image.path);
      return image;
    }
  }
}
