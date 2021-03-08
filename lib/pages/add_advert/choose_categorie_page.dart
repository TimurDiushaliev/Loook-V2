import 'package:flutter/material.dart';
import 'package:loook/responsive_size/media_query.dart';
import 'package:loook/widgets/add_advert_pages/choose_categorie_page/categories.dart';

class ChooseCategoriePage extends StatelessWidget {
  const ChooseCategoriePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0x252837),
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
                left: MediaQuerySize.width(context) * 0.7,
                top: MediaQuerySize.height(context) * 0.05),
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(18)),
                child: Text('Любимые'),
                onPressed: () {}),
          ),
          Container(
            margin: EdgeInsets.only(
                left: MediaQuerySize.width(context) * 0.02,
                bottom: MediaQuerySize.height(context) * 0.05),
            child: Text(
              'Выберите категорию:',
              style: TextStyle(fontSize: 22),
            ),
          ),
          Expanded(
            child: Categories(),
          )
        ],
      ),
    );
  }
}
