import 'package:flutter/material.dart';
import 'package:loook/responsive_size/media_query.dart';
import 'package:loook/values/strings.dart';

class ChooseCategoriePage extends StatelessWidget {
  const ChooseCategoriePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30,
            width: 1000,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            // color: Colors.red,
            child: Text('1'),
          ),
          Container(
            margin: EdgeInsets.only(left: MediaQuerySize.width(context) * 0.7),
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(18)),
                child: Text('Любимые'),
                onPressed: () {}),
          ),
          Container(
            child: Text(
              'Выберите категорию',
              style: TextStyle(fontSize: 23),
            ),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: Strings.categoriesList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1, crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print('index: $index tapped');
                    },
                    child: Card(
                      color: index % 2 == 0 ? Colors.red : Colors.brown,
                      child: Center(child: Text(Strings.categoriesList[index])),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
