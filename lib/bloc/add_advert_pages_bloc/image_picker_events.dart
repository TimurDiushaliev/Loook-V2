import 'dart:io';

abstract class ImagePickerEvents{}

class PickImageEvent extends ImagePickerEvents{}

class DeletePickedImageEvent extends ImagePickerEvents{}