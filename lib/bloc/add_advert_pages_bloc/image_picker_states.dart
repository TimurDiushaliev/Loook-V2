import 'dart:io';
import 'package:flutter/cupertino.dart';


abstract class ImagePickerStates {}

class ImageNotSelectedState extends ImagePickerStates {}

class ImagePickedState extends ImagePickerStates {
  List<File> imageList;
  ImagePickedState({@required this.imageList}) : assert(imageList!=null);
}

class DeletedImageState extends ImagePickerStates {}

class ImagePickerError extends ImagePickerStates {}
