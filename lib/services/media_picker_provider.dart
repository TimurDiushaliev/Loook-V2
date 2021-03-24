import 'dart:io';

import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class MediaPickerProvider {
  static Future<List<File>> pickImages() async {
    List<Asset> imageList = <Asset>[];
    List<File> imageListFiles = <File>[];
    try {
      imageList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: imageList,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          statusBarColor: '#212121',
          actionBarColor: '#212121',
          actionBarTitle: 'Выберите фотографии',
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
      for (int i = 0; i < imageList.length; i++) {
        String path =
            await FlutterAbsolutePath.getAbsolutePath(imageList[i].identifier);
        print('path $path');
        imageListFiles.add(File(path));
      }

      return imageListFiles;
    } catch (e) {
      print('multi image picker exception $e');
    }
    return imageListFiles;
  }

  static Future<String> pickVideo() async {
    final _picker = ImagePicker();
    final _pickedFile = await _picker.getVideo(source: ImageSource.gallery);
    if (_pickedFile != null) {
      print('${_pickedFile.path}');
      return _pickedFile.path;
    } else
      print('video not selected');
    return null;
  }
}
