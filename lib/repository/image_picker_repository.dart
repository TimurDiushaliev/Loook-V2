import 'package:loook/services/image_picker_provider.dart';

class ImagePickerRepository {
  static get images => ImagePickerProvider.pickImages();
}
