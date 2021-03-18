import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/categories_details_bloc/categories_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/categories_details_bloc/categories_details_states.dart';
import 'package:loook/pages/add_advert/categories_page.dart';

class AddAdvertActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => CategoriesDetailsBloc(
                  CategoriesDetailsIsNotFetchedState(),
                ),
                child: CategoriesPage(),
              ),
            ),
          );
        });
  }
}
