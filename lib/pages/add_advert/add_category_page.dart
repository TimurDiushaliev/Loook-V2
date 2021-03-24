import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/fetching_categories_bloc/fetching_categories_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/fetching_categories_bloc/fetching_categories_events.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/widgets/add_advert_pages_widgets/add_category_page/categories_list.dart';
import 'package:loook/widgets/add_advert_pages_widgets/chosen_details_list.dart';

class AddCategoryPage extends StatefulWidget {
  @override
  _AddCategoryPageState createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  @override
  void initState() {
    FetchingCategoriesBloc _categoriesDetailsBloc =
        BlocProvider.of<FetchingCategoriesBloc>(context);
    _categoriesDetailsBloc.add(FetchCategoriesListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          SizedBox(height: ResponsiveSizeProvider.height(context) * 0.05),
          ChosenDetailsList(),
          SizedBox(height: ResponsiveSizeProvider.height(context) * 0.05),
          Text(
            'Выберите Категорию',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: ResponsiveSizeProvider.height(context) * 0.05,
          ),
          CategoriesList()
        ],
      ),
    );
  }

  @override
  void dispose() {
    FetchingCategoriesBloc _categoriesDetailsBloc =
        BlocProvider.of<FetchingCategoriesBloc>(context);
    _categoriesDetailsBloc.close();
    super.dispose();
  }
}
