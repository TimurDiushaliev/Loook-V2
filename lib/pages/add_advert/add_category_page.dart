import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_events.dart';
import 'package:loook/bloc/add_advert_pages_blocs/chosed_details_bloc/chosed_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/chosed_details_bloc/chosed_details_events.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/widgets/add_advert_pages_widgets/add_category_page/categories_list.dart';
import 'package:loook/widgets/add_advert_pages_widgets/chosen_details_list.dart';

class AddCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ChosedDetailsBloc _chosedDetailsBloc =
        BlocProvider.of<ChosedDetailsBloc>(context);
    return WillPopScope(
      onWillPop: () {
        _chosedDetailsBloc.add(RemoveLastIndexOfChosedDetailsEvent());
        Navigator.pop(context);
      },
      child: Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            SizedBox(height: ResponsiveSizeProvider.height(context) * 0.05),
            ChosedDetailsList(),
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
      ),
    );
  }
}
