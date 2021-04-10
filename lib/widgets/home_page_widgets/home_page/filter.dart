import 'package:flutter/material.dart';

class Filter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
      onPressed: (){
        //TODO: filter adverts
      },
    );
  }
}
