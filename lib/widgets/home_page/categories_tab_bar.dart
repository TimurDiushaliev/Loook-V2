import 'package:flutter/material.dart';

class CategoriesTabBar extends StatelessWidget {
  const CategoriesTabBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TabBar(isScrollable: true, indicatorColor: Colors.red, tabs: [
          Tab(
            text: 'Транспорт',
          ),
          Tab(
            text: 'Недвижимость',
          ),
          Tab(
            text: 'Одежда',
          ),
          Tab(
            text: 'Техника',
          )
        ]);
      
   
  }
}
