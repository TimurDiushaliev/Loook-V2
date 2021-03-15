import 'package:loook/services/media_picker_provider.dart';

class MediaPickerRepository {
  static get images => MediaPickerProvider.pickImages();
  static get video => MediaPickerProvider.pickVideo();
}
