import 'package:flutter/cupertino.dart';

abstract class MediaPickerEvents {}

class PickImagesEvent extends MediaPickerEvents {}

class DeletePickedImageEvent extends MediaPickerEvents {
  int index;
  DeletePickedImageEvent({
    @required this.index,
  });
}

class PickVideoEvent extends MediaPickerEvents {}
