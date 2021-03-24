import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_events.dart';
import 'package:loook/pages/add_advert/add_price_page.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class AutoFillSwitchAndNavigationButton extends StatelessWidget {
  final TextEditingController title;
  final TextEditingController description;
  AutoFillSwitchAndNavigationButton(
      {@required this.title, @required this.description});
  @override
  Widget build(BuildContext context) {
    AdvertDetailsBloc _advertDescriptionBloc =
        BlocProvider.of<AdvertDetailsBloc>(context);
    return Row(
      children: [
        SizedBox(
          width: ResponsiveSizeProvider.width(context) * 0.05,
        ),
        Container(
          child: Column(
            children: [
              Text('Автозаполнение'),
              Switch(value: false, onChanged: (a) => true)
            ],
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
              _advertDescriptionBloc.add(AddDetailEvent(advertDetail: {
                'title': title.text,
                'description': description.text
              }));
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddPricePage()));
            }),
        SizedBox(
          width: ResponsiveSizeProvider.width(context) * 0.05,
        ),
      ],
    );
  }
}
