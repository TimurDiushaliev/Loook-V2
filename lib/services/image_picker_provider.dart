import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerProvider {
  static Future<File> getImage() async {
    File _image;
    final _picker = ImagePicker();
    final _pickedImage = await _picker.getImage(source: ImageSource.gallery);
    if (_pickedImage != null)
      _image = File(_pickedImage.path);
    else
      throw Exception('image = $_pickedImage');
    print('$_image');
    return _image;
  }
}
