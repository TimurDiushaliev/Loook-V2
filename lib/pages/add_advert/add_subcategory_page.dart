import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_events.dart';
import 'package:loook/bloc/add_advert_pages_blocs/chosed_details_bloc/chosed_details_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/chosed_details_bloc/chosed_details_events.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/widgets/add_advert_pages_widgets/add_subcategory_page/sub_categories_list.dart';
import 'package:loook/widgets/add_advert_pages_widgets/chosen_details_list.dart';

class AddSubCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AdvertDetailsBloc _advertDetailsBloc =
        BlocProvider.of<AdvertDetailsBloc>(context);
    ChosedDetailsBloc _chosedDetailsBloc =
        BlocProvider.of<ChosedDetailsBloc>(context);
    return WillPopScope(
      onWillPop: () {
        _chosedDetailsBloc.add(RemoveLastIndexOfChosedDetailsEvent());
        _advertDetailsBloc.add(FetchCategoriesListEvent());
      },
      child: ListView(
        children: [
          SizedBox(
            height: ResponsiveSizeProvider.height(context) * 0.05,
          ),
          ChosedDetailsList(),
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
