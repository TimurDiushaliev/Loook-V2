import 'package:flutter/material.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/widgets/add_advert_pages/categories_page/categories_list.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          SizedBox(
            height: ResponsiveSizeProvider.height(context) * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Text(
                  'Выберите категорию:',
                  style: TextStyle(fontSize: 21),
                ),
              ),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(18)),
                  child: Text(
                    'Любимые',
                    style: TextStyle(fontSize: 13),
                  ),
                  onPressed: () {}),
            ],
          ),
          SizedBox(
            height: ResponsiveSizeProvider.height(context) * 0.05,
          ),
          CategoriesList(),
        ],
      ),
    );
  }
}
