import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_states.dart';
import 'package:loook/pages/add_advert/add_category_details_page.dart';
import 'package:loook/pages/add_advert/add_category_page.dart';
import 'package:loook/pages/add_advert/add_subcategory_page.dart';

class AddAdvertDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<AdvertDetailsBloc, AdvertDetailsStates>(
        builder: (context, state) {
          if (state is CategoriesListFetchedState) return AddCategoryPage();
          if (state is SubCategoriesListFetchedState)
            return AddSubCategoryPage();
          if (state is CategoryDetailsFetchedState)
            return AddCategoryDetailsPage();
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
