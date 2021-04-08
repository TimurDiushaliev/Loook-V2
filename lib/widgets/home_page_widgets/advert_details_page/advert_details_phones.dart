import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:loook/bloc/home_page_blocs/advert_by_id_bloc/advert_by_id_bloc.dart';
import 'package:loook/bloc/home_page_blocs/advert_by_id_bloc/advert_by_id_states.dart';
import 'package:loook/services/phone_call_provider.dart';

class AdvertDetailsPhones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvertByIdBloc, AdvertByIdStates>(
      builder: (context, state) {
        if (state is AdvertByIdFetchedState) {
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
                onTap: () {
                  PhoneCallProvider.phoneCall('${state.advertById.phone}');
                },
              )
            ],
          );
        }
        return Container();
      },
    );
  }
}
