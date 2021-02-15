import 'package:flutter/material.dart';

class InfoDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Продаю Путина 2107',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        Container(
          width: 100,
          child: Center(
            child: Text('50 KGS'),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.grey),
        ),
        Text(
          'Описание',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        Text('Состояние хорошее, хорошо правит страной.')
      ],
    );
  }
}
