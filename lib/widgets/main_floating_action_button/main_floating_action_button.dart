import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_events.dart';
import 'package:loook/pages/add_advert/add_category_page.dart';

class MainFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.red,
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: () {
        BlocProvider.of<AdvertDetailsBloc>(context)
            .add(FetchCategoriesListEvent());
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddCategoryPage(),
          ),
        );
      },
    );
  }
}

