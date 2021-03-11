import 'package:flutter/material.dart';
import 'package:loook/responsive_size/media_query.dart';

class ChooseSubCategoriePage extends StatelessWidget {
  final title;
  ChooseSubCategoriePage({@required this.title});

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
            children: [
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(child: Text(title))),
            ],
          ),
          SizedBox(
            height: MediaQuerySize.height(context) * 0.05,
          ),
          Text(
            'Выберите подкатегорию',
            style: TextStyle(fontSize: 21),
          ),
          SizedBox(
            height: MediaQuerySize.height(context) * 0.05,
          ),
          GridView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Card(
                  color: Color(0x252837),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.white)),
                  child: Center(
                    child: Text('Подкатегории'),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
