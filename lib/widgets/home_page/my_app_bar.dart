import 'package:flutter/material.dart';
import 'package:loook/style/search_style.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.purple[800],
      title: Container(
        height: 50,
        child: TextField(decoration: SearchStyle.searchInput),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.filter,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
