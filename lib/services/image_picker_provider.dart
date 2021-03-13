import 'package:multi_image_picker/multi_image_picker.dart';

class ImagePickerProvider {
  static Future<List<Asset>> pickImages() async {
    List<Asset> imageList = <Asset>[];
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
      return imageList;
    } catch (e) {
      print('exc $e');
    }
    return imageList;
  }
}
