import 'dart:io';

import 'package:loook/services/image_picker_provider.dart';

class ImagePickerRepository {
  static get image => ImagePickerProvider.getImage();
  List<File> imageList;
  
}
