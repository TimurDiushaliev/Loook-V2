import 'package:flutter/cupertino.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

abstract class ImagePickerEvents {}

class PickImageEvent extends ImagePickerEvents {}

class DeletePickedImageEvent extends ImagePickerEvents {
  int index;
  List<Asset> refreshImageList;
  DeletePickedImageEvent({@required this.index, @required this.refreshImageList});
}
