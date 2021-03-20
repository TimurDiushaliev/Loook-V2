import 'package:flutter/material.dart';

class CategoriesToChooseTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Text(
            'Выберите категорию:',
            style: TextStyle(fontSize: 21),
          ),
        ),
        MaterialButton(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(18)),
            child: Text(
              'Любимые',
              style: TextStyle(fontSize: 13),
            ),
            onPressed: () {}),
      ],
    );
  }
}
