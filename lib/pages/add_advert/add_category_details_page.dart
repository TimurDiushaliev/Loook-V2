import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_events.dart';
import 'package:loook/widgets/add_advert_pages_widgets/add_category_details_page/category_details_list.dart';
import 'package:loook/widgets/add_advert_pages_widgets/add_category_details_page/category_details_title.dart';
import 'package:loook/widgets/add_advert_pages_widgets/chosen_details_list.dart';

class AddCategoryDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AdvertDetailsBloc _advertDetailsBloc =
        BlocProvider.of<AdvertDetailsBloc>(context);
    return WillPopScope(
      onWillPop: () {
        _advertDetailsBloc.add(FetchSubCategoriesListEvent());
      },
      child: Scaffold(
        body: Column(
          children: [
            ChosenDetailsList(),
            CategoryDetailsTitle(),
            CategoryDetailsList(),
          ],
        ),
      ),
    );
  }
}
