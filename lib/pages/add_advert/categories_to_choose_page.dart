import 'package:flutter/material.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/widgets/add_advert_pages_widgets/categories_to_choose_page/categories_list_to_choose.dart';
import 'package:loook/widgets/add_advert_pages_widgets/categories_to_choose_page/categories_to_choose_title.dart';

class CategoriesToChoosePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          SizedBox(
            height: ResponsiveSizeProvider.height(context) * 0.05,
          ),
          CategoriesToChooseTitle(),
          SizedBox(
            height: ResponsiveSizeProvider.height(context) * 0.05,
          ),
          CategoriesListToChoose(),
        ],
      ),
    );
  }
}
