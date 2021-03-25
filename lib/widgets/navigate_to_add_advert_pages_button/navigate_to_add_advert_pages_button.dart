import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/fetching_categories_bloc/fetching_categories_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/fetching_categories_bloc/fetching_categories_events.dart';
import 'package:loook/pages/add_advert/add_category_page.dart';

class NavigateToAddAdvertPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FetchingCategoriesBloc _fetchingCategoriesBloc = BlocProvider.of<FetchingCategoriesBloc>(context);
    return FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          _fetchingCategoriesBloc.add(FetchCategoriesListEvent());
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddCategoryPage(),
            ),
          );
        });
  }
}
