import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/media_picker_bloc/media_picker_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/media_picker_bloc/media_picker_events.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class AddMediaActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaPickerBloc _imagePickerBloc =
        BlocProvider.of<MediaPickerBloc>(context);
    return Container(
      height: ResponsiveSizeProvider.height(context) * 0.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: ResponsiveSizeProvider.width(context) * 0.45,
            child: GestureDetector(
              onTap: () => _imagePickerBloc.add(PickImagesEvent()),
              child: Card(
                color: Color(0x252837),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.white)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera),
                    Text('Загрузить фото'),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: ResponsiveSizeProvider.width(context) * 0.45,
            child: GestureDetector(
              onTap: () => _imagePickerBloc.add(PickVideoEvent()),
              child: Card(
                color: Color(0x252837),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.white)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.video_call),
                    Text('Загрузить видео'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
