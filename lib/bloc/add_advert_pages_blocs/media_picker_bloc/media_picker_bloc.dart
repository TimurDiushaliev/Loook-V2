import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/media_picker_bloc/media_picker_events.dart';
import 'package:loook/bloc/add_advert_pages_blocs/media_picker_bloc/media_picker_states.dart';
import 'package:loook/repository/media_picker_repository.dart';
import 'package:video_player/video_player.dart';

class MediaPickerBloc extends Bloc<MediaPickerEvents, MediaPickerStates> {
  MediaPickerBloc(MediaPickerStates initialState) : super(initialState);
  List<File> imageList = [];
  VideoPlayerController videoPlayerController;

  @override
  Stream<MediaPickerStates> mapEventToState(MediaPickerEvents event) async* {
    if (event is PickImagesEvent)
      try {
        imageList.addAll(await MediaPickerRepository.images);
        yield ImagesPickedState(imageList: imageList);
      } catch (_) {
        print('mediaPickerException $_');
        yield MediaPickerError();
      }

    if (event is DeletePickedImageEvent) {
      imageList.removeAt(event.index);
      yield ImagesPickedState(imageList: imageList);
    }
    if (event is PickVideoEvent) {
      String videoPath = await MediaPickerRepository.video;
      videoPlayerController = VideoPlayerController.file(File(videoPath))
        ..initialize();
      yield VideoPickedState(videoPlayerController: videoPlayerController);
    }
  }
}
