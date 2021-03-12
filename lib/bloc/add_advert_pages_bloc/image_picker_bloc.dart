import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_bloc/image_picker_events.dart';
import 'package:loook/bloc/add_advert_pages_bloc/image_picker_states.dart';
import 'package:loook/repository/image_picker_repository.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvents, ImagePickerStates> {
  ImagePickerBloc(ImagePickerStates initialState) : super(initialState);

  @override
  Stream<ImagePickerStates> mapEventToState(ImagePickerEvents event) async* {
    if (event is PickImageEvent)
      try {
        List<File> imageList = [];
        imageList.add(await ImagePickerRepository.image);
        print('imagelist = $imageList');
        yield ImagePickedState(imageList: imageList);
      } catch (_) {
        print(_);
        ImagePickerError();
      }
    if (event is DeletePickedImageEvent) yield DeletedImageState();
  }
}
