import 'package:flutter/material.dart';

class AccountInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kTextTabBarHeight;
    final _width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          height: _height * 0.15,
          width: _width * 0.3,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://www.buro247.ua/thumb/670x830_0/images/2021/01/elon-musk-now-richest-person-01.jpg'),
          ),
        ),
        Column(
          children: [
            Text(
              'Иванов Иван',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Дата регистрации: 12.12.1212'),
          ],
        ),
      ],
    );
  }
}
