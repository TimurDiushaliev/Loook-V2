import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.purple[800],
      title: TextField(
        decoration: InputDecoration(hintText: 'Найти',hintStyle: TextStyle(color: Colors.white)),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search, color: Colors.white,),
        ),
        IconButton(
          icon: Icon(Icons.filter, color: Colors.white,),
        ),
      ],
    );
  }
}
