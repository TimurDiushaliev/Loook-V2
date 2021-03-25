import 'package:flutter/material.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/widgets/add_advert_pages_widgets/add_category_page/categories_list.dart';
import 'package:loook/widgets/add_advert_pages_widgets/chosen_details_list.dart';

class AddCategoryPage extends StatelessWidget {
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
}
