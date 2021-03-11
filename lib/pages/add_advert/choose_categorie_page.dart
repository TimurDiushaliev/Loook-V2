import 'package:flutter/material.dart';
import 'package:loook/responsive_size/media_query.dart';
import 'package:loook/widgets/add_advert_pages/choose_categorie_page/categories.dart';

class ChooseCategoriePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuerySize.height(context) * 0.05,
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
            height: MediaQuerySize.height(context) * 0.05,
          ),
          Categories(),
        ],
      ),
    );
  }
}
