import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.purple[800],
      title: TextField(
        decoration: InputDecoration(
            hintText: 'Найти', hintStyle: TextStyle(color: Colors.white)),
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
