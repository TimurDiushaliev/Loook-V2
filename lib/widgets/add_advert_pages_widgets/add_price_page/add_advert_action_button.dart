import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_events.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_states.dart';
import 'package:loook/main.dart';

class AddAdvertActionButton extends StatelessWidget {
  final TextEditingController price;
  AddAdvertActionButton({@required this.price});
  @override
  Widget build(BuildContext context) {
    AdvertDetailsBloc _advertDetailsBloc =
        BlocProvider.of<AdvertDetailsBloc>(context);
    return BlocBuilder<AdvertDetailsBloc, AdvertDetailsStates>(
      builder: (context, state) => MaterialButton(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          child: Text(
            'Подать',
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            _advertDetailsBloc.add(AddDetailEvent(advertDetail: {
              'price': price.text,
              'currency': state is CurrencyChangedState ? state.currency : 'KGS'
            }));
            _advertDetailsBloc.add(UploadAdvertEvent());
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> MyApp()), (route) => false);
          }),
    );
  }
}
