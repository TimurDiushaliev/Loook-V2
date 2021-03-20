import 'package:flutter/material.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/widgets/add_advert_pages_widgets/category_details_page/category_details_list.dart';
import 'package:loook/widgets/add_advert_pages_widgets/chosen_details_list.dart';

class CategoryDetailsPage extends StatelessWidget {
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
            'Выберите подкатегорию',
            style: TextStyle(fontSize: 21),
          ),
          SizedBox(
            height: ResponsiveSizeProvider.height(context) * 0.05,
          ),
          CategoryDetailsList(),
        ],
      ),
    );
  }
}
