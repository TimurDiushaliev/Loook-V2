import 'package:flutter/material.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_states.dart';

class AdvertDetailsTitle extends StatelessWidget {
  final dynamic state;
  AdvertDetailsTitle({@required this.state});
  @override
  Widget build(BuildContext context) {
    return Text(
      state is CategoriesListFetchedState
          ? 'Выберите Категорию'
          : 'Выберите Подкатегорию',
      style: TextStyle(fontSize: 20),
    );
  }
}
