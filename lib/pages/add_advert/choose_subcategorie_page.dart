import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_bloc/image_picker_bloc.dart';
import 'package:loook/bloc/add_advert_pages_bloc/image_picker_states.dart';
import 'package:loook/pages/add_advert/add_media_page.dart';
import 'package:loook/responsive_size/media_query.dart';

class ChooseSubCategoriePage extends StatelessWidget {
  final categorie;
  ChooseSubCategoriePage({@required this.categorie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuerySize.height(context) * 0.05,
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(categorie),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuerySize.height(context) * 0.05,
          ),
          Text(
            'Выберите подкатегорию',
            style: TextStyle(fontSize: 21),
          ),
          SizedBox(
            height: MediaQuerySize.height(context) * 0.05,
          ),
          GridView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=> BlocProvider(create: (context)=>ImagePickerBloc(ImageNotSelectedState()),child: AddMediaPage()))),
                              child: Card(
                    color: Color(0x252837),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.white)),
                    child: Center(
                      child: Text('Подкатегории'),
                    )),
              );
            },
          ),
        ],
      ),
    );
  }
}
