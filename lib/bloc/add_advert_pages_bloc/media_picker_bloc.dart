import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_bloc/media_picker_events.dart';
import 'package:loook/bloc/add_advert_pages_bloc/media_picker_states.dart';
import 'package:loook/repository/media_picker_repository.dart';

class MediaPickerBloc extends Bloc<MediaPickerEvents, MediaPickerStates> {
  MediaPickerBloc(MediaPickerStates initialState) : super(initialState);
  List<String> mediaList = [];

  @override
  Stream<MediaPickerStates> mapEventToState(MediaPickerEvents event) async* {
    if (event is PickImagesEvent)
      try {
        mediaList.addAll(await MediaPickerRepository.images);
        print('imagelist = $mediaList');
        yield MediaPickedState(mediaList: mediaList);
      } catch (_) {
        print('mediaPickerException $_');
        yield MediaPickerError();
      }
    if (event is DeletePickedImageEvent) {
      mediaList.removeAt(event.index);
      yield MediaPickedState(mediaList: mediaList);
    }
    // if (event is PickVideoEvent) {
    //   mediaList.add(await MediaPickerRepository.video);
    //   yield MediaPickedState(mediaList: mediaList);
    // }
  }
}
