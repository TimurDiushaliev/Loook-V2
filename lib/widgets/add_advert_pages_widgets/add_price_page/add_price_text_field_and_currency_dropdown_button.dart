import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_events.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_states.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class AddPriceTextFieldAndCurrencyDropDownButton extends StatelessWidget {
  final TextEditingController price;
  final GlobalKey<FormState> priceKey;
  AddPriceTextFieldAndCurrencyDropDownButton(
      {@required this.price, @required this.priceKey});
  @override
  Widget build(BuildContext context) {
    AdvertDetailsBloc _advertDetailsBloc =
        BlocProvider.of<AdvertDetailsBloc>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Form(
          key: priceKey,
          child: Container(
            width: ResponsiveSizeProvider.width(context) * 0.7,
            child: TextFormField(
              controller: price,
              validator: (value) {
                if (value.runtimeType != int)
                  return 'Допустимы только целые числа';
              },
              inputFormatters: [LengthLimitingTextInputFormatter(2147483647)],
              decoration: InputDecoration(hintText: 'Цена'),
            ),
          ),
        ),
        BlocBuilder<AdvertDetailsBloc, AdvertDetailsStates>(
          builder: (context, state) {
            return Container(
              child: DropdownButton(
                value: state is CurrencyChangedState ? state.currency : 'KGS',
                onChanged: (value) {
                  _advertDetailsBloc.add(ChangeCurrencyEvent(currency: value));
                  _advertDetailsBloc
                      .add(AddDetailEvent(advertDetail: {'currency': value}));
                },
                items: [
                  DropdownMenuItem(value: 'KGS', child: Text('KGS')),
                  DropdownMenuItem(value: 'USD', child: Text('USD')),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
