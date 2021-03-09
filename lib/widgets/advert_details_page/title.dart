import 'package:flutter/material.dart';

class InfoTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: _width * 0.1),
      width: _width * 0.5,
      child: Text(
        'Продам авто запорожец 1984 года',
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
    );
  }
}
