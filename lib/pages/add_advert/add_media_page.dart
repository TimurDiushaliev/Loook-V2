import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_bloc/image_picker_bloc.dart';
import 'package:loook/bloc/add_advert_pages_bloc/image_picker_events.dart';
import 'package:loook/bloc/add_advert_pages_bloc/image_picker_states.dart';

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
                  onTap: () => _imagePickerBloc.add(
                    PickImageEvent(),
                  ),
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
          BlocBuilder<ImagePickerBloc, ImagePickerStates>(
            builder: (context, state) {
              if (state is ImagePickedState) {
                state.imageList.map((e) => GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      print('$e');
                      return Image.file(e);
                    }));
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}
