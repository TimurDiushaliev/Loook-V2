import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/media_picker_bloc/media_picker_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/media_picker_bloc/media_picker_events.dart';
import 'package:loook/bloc/add_advert_pages_blocs/media_picker_bloc/media_picker_states.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:video_player/video_player.dart';

class AddMediaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaPickerBloc _imagePickerBloc =
        BlocProvider.of<MediaPickerBloc>(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          SizedBox(height: ResponsiveSizeProvider.height(context) * 0.03),
          Container(
            height: ResponsiveSizeProvider.height(context) * 0.07,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        'categorie',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: ResponsiveSizeProvider.width(context) * 0.03,
                  );
                },
                itemCount: 10),
          ),
          SizedBox(
            height: ResponsiveSizeProvider.height(context) * 0.07,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  'Добавьте фото и видео',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Spacer(),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(18)),
                  child: Text(
                    'Дальше',
                    style: TextStyle(fontSize: 13),
                  ),
                  onPressed: () {}),
            ],
          ),
          SizedBox(
            height: ResponsiveSizeProvider.height(context) * 0.04,
          ),
          Container(
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
          ),
          SizedBox(
            height: ResponsiveSizeProvider.height(context) * 0.05,
          ),
          BlocBuilder<MediaPickerBloc, MediaPickerStates>(
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
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        crossAxisCount: 2),
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
          )
        ],
      ),
    );
  }
}
