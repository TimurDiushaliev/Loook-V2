import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/fetching_categories_bloc/fetching_categories_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/fetching_categories_bloc/fetching_categories_events.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/widgets/add_advert_pages_widgets/add_subcategory_page/sub_categories_list.dart';
import 'package:loook/widgets/add_advert_pages_widgets/chosen_details_list.dart';

class AddSubCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FetchingCategoriesBloc _advertDetailsBloc =
        BlocProvider.of<FetchingCategoriesBloc>(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          SizedBox(
            height: ResponsiveSizeProvider.height(context) * 0.05,
          ),
          ChosenDetailsList(),
          SizedBox(
            height: ResponsiveSizeProvider.height(context) * 0.05,
          ),
          Text(
            'Выберите подкатегорию',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: ResponsiveSizeProvider.height(context) * 0.05,
          ),
          SubCategoriesList(),
        ],
      ),
    );
  }
}
