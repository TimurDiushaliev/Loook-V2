import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_bloc/image_picker_bloc.dart';
import 'package:loook/bloc/add_advert_pages_bloc/image_picker_events.dart';
import 'package:loook/bloc/add_advert_pages_bloc/image_picker_states.dart';
import 'package:loook/responsive_size/media_query.dart';
import 'package:loook/services/image_picker_provider.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class AddMediaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ImagePickerBloc _imagePickerBloc =
        BlocProvider.of<ImagePickerBloc>(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
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
                    width: 10,
                  );
                },
                itemCount: 10),
          ),
          SizedBox(
            height: 30,
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
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 120,
                width: 170,
                child: GestureDetector(
                  onTap: () => _imagePickerBloc.add(PickImageEvent()),
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
                height: 120,
                width: 170,
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
            ],
          ),
          SizedBox(
            height: MediaQuerySize.height(context) * 0.05,
          ),
          BlocBuilder<ImagePickerBloc, ImagePickerStates>(
            builder: (context, state) {
              print('$state');
              if (state is ImagePickedState) {
                return Container(
                  margin: EdgeInsets.only(
                      left: MediaQuerySize.width(context) * 0.05,
                      right: MediaQuerySize.width(context) * 0.05),
                  child: GridView.builder(
                    itemCount: state.imageList.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white)),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            AssetThumb(
                                asset: state.imageList[index],
                                width: 300,
                                height: 300),
                            IconButton(
                              icon: Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                _imagePickerBloc.add(DeletePickedImageEvent(index: index, refreshImageList: state.imageList));
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}
