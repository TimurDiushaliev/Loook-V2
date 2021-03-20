import 'package:flutter/material.dart';
import 'package:loook/services/search.dart';

class SearchIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.search,
        color: Colors.white,
      ),
      onPressed: () {
        showSearch(context: context, delegate: Search());
      },
    );
  }
}
