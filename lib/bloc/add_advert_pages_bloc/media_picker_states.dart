import 'package:flutter/cupertino.dart';



abstract class MediaPickerStates {}

class ImageNotSelectedState extends MediaPickerStates {}

class MediaPickedState extends MediaPickerStates {
  List<String> mediaList;
  MediaPickedState({@required this.mediaList}) : assert(mediaList!=null);
}

class DeletedImageState extends MediaPickerStates {}

// class VideoPickedState extends MediaPickerStates {
//   String videoFilePath;
//   VideoPickedState({@required this.videoFilePath}) : assert(videoFilePath != null);
// }

class MediaPickerError extends MediaPickerStates {}
