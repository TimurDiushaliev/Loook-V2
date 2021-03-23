import 'package:flutter/material.dart';

class AddAdvertActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Text(
        'Подать',
        style: TextStyle(color: Colors.black),
      ),
      // onPressed: () => _advertDetailsBloc.add(
      //   AddAdvertEvent(advertDetail: 1),
      // ),
    );
  }
}
