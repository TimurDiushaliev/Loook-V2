import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_events.dart';

class AddMediaTitleAndNavigation extends StatelessWidget {
  final dynamic state;
  AddMediaTitleAndNavigation({@required this.state});
  @override
  Widget build(BuildContext context) {
    print('$state');
    AdvertDetailsBloc _advertDetailsBloc =
        BlocProvider.of<AdvertDetailsBloc>(context);
    return Row(
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
            onPressed: () {
              _advertDetailsBloc.add(NavigateToAddDescriptionEvent());
              _advertDetailsBloc.add(
                  AddDetailEvent(advertDetail: {'images': state.imageList}));
            })
      ],
    );
  }
}
