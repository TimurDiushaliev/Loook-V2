import 'package:flutter/cupertino.dart';
import 'package:multi_image_picker/multi_image_picker.dart';


abstract class ImagePickerStates {}

class ImageNotSelectedState extends ImagePickerStates {}

class ImagePickedState extends ImagePickerStates {
  List<Asset> imageList;
  ImagePickedState({@required this.imageList}) : assert(imageList!=null);
}

class DeletedImageState extends ImagePickerStates {}

class ImagePickerError extends ImagePickerStates {}
