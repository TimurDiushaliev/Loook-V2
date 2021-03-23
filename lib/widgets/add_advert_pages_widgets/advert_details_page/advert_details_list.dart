import 'package:flutter/material.dart';
import 'package:loook/bloc/add_advert_pages_blocs/advert_details_bloc/advert_details_states.dart';
import 'package:loook/widgets/add_advert_pages_widgets/add_category_page/categories_list.dart';
import 'package:loook/widgets/add_advert_pages_widgets/add_subcategory_page/sub_categories_list.dart';

class AdvertDetailsList extends StatelessWidget {
  final dynamic state;
  AdvertDetailsList({@required this.state});
  @override
  Widget build(BuildContext context) {
    print('object $state');
    if (state is CategoriesListFetchedState)
      return CategoriesList(state: state);
    if (state is SubCategoriesListFetchedState)
      return SubCategoriesList(
        state: state,
      );
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
