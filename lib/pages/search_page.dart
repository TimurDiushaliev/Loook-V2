import 'package:flutter/material.dart';
import 'package:loook/styles/search_page_style.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Поиск'),
      ),
      body: Column(children: [
        TextField(),
        Text(
          'Популярные запросы: ',
          style: SearchPageStyle.popularQueryTextStyle,
        ),
      ]),
    );
  }
}
