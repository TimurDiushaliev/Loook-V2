import 'package:flutter/material.dart';
import 'package:loook/widgets/search_results_widgets/search_result_list.dart';

class Search extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  @override
  String get searchFieldLabel => 'Поиск...';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
  
    return SearchResultList(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(
            'Популярные запросы:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Row(
          children: [
            Container(
                margin: EdgeInsets.only(left: 5, top: 10),
                child: Icon(Icons.history)),
            Container(
                margin: EdgeInsets.only(left: 5, top: 10),
                child: Text('dsada')),
          ],
        ),
        Row(
          children: [
            Container(
                margin: EdgeInsets.only(left: 5, top: 10),
                child: Icon(Icons.history)),
            Container(
                margin: EdgeInsets.only(left: 5, top: 10),
                child: Text('dsada')),
          ],
        ),
        Row(
          children: [
            Container(
                margin: EdgeInsets.only(left: 5, top: 10),
                child: Icon(Icons.history)),
            Container(
                margin: EdgeInsets.only(left: 5, top: 10),
                child: Text('dsada')),
          ],
        ),
      ],
    );
  }
}
