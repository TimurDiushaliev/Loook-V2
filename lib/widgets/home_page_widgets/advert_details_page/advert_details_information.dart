import 'package:flutter/material.dart';

class AdvertDetailsInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: _height * 0.1, left: _width * 0.05),
      child: Text(
        'Информация:',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    );
  }
}
