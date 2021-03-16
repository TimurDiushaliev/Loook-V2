import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';



abstract class MediaPickerStates {}

class ImageNotSelectedState extends MediaPickerStates {}

class ImagesPickedState extends MediaPickerStates {
  List<String> imageList;
  ImagesPickedState({@required this.imageList}) : assert(imageList!=null);
}

class DeletedImageState extends MediaPickerStates {}

class VideoPickedState extends MediaPickerStates {
  VideoPlayerController videoPlayerController;
  VideoPickedState({@required this.videoPlayerController}) : assert(videoPlayerController != null);
}

class MediaPickerError extends MediaPickerStates {}
