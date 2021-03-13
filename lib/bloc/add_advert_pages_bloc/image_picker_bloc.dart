import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_bloc/image_picker_events.dart';
import 'package:loook/bloc/add_advert_pages_bloc/image_picker_states.dart';
import 'package:loook/repository/image_picker_repository.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvents, ImagePickerStates> {
  ImagePickerBloc(ImagePickerStates initialState) : super(initialState);

  @override
  Stream<ImagePickerStates> mapEventToState(ImagePickerEvents event) async* {
    if (event is PickImageEvent)
      try {
        List<Asset> imageList = [];
        imageList.addAll(await ImagePickerRepository.images);
        print('imagelist = $imageList');
        yield ImagePickedState(imageList: imageList);
      } catch (_) {
        print(_);
        yield ImagePickerError();
      }
    if (event is DeletePickedImageEvent) {
      event.refreshImageList.removeAt(event.index);
      yield ImagePickedState(imageList: event.refreshImageList);
    }
  }
}
