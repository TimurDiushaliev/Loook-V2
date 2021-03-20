import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/media_picker_bloc/media_picker_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/media_picker_bloc/media_picker_events.dart';
import 'package:loook/bloc/add_advert_pages_blocs/media_picker_bloc/media_picker_states.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:video_player/video_player.dart';

class AddedMediaList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaPickerBloc _imagePickerBloc =
        BlocProvider.of<MediaPickerBloc>(context);
    return BlocBuilder<MediaPickerBloc, MediaPickerStates>(
      builder: (context, state) {
        print('$state');
        if (state is ImagesPickedState) {
          return Container(
            margin: EdgeInsets.only(
                left: ResponsiveSizeProvider.width(context) * 0.05,
                right: ResponsiveSizeProvider.width(context) * 0.05),
            child: GridView.builder(
              itemCount: state.imageList.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 20, mainAxisSpacing: 20, crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                      ),
                      width: ResponsiveSizeProvider.width(context) * 0.4,
                      child: Image.file(
                        File(state.imageList[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        _imagePickerBloc
                            .add(DeletePickedImageEvent(index: index));
                      },
                    ),
                  ],
                );
              },
            ),
          );
        }
        if (state is VideoPickedState) {
          if (state.videoPlayerController.value.isInitialized) {
            try {
              state.videoPlayerController.play();
              return GridView.builder(
                  shrinkWrap: true,
                  itemCount: 1,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return VideoPlayer(state.videoPlayerController);
                  });
            } catch (e) {
              print('video exception $e');
            }
          }
        }
        return Container();
      },
    );
  }
}
