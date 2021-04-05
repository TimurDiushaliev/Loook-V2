import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:loook/bloc/home_page_blocs/advert_by_id_bloc/advert_by_id_bloc.dart';
import 'package:loook/bloc/home_page_blocs/advert_by_id_bloc/advert_by_id_states.dart';

class AdvertDetailsPhones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvertByIdBloc, AdvertByIdStates>(
      builder: (context, state) {
        if (state is AdvertByIdFetchedState) {
          print(state.advertById.phone);
          return SpeedDial(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            icon: Icons.phone,
            activeIcon: Icons.close,
            children: [
              SpeedDialChild(
                backgroundColor: Colors.green,
                labelBackgroundColor: Colors.green,
                label: '${state.advertById.phone}',
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://www.megacom.kg/uploads/ckeditor/pictures/1665/content_ru_Исходники.png',
                  ),
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
