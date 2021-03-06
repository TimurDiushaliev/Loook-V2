import 'package:flutter/material.dart';
import 'package:loook/responsive_size/media_query.dart';

class AccountInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuerySize.height(context) * 0.05,
          left: MediaQuerySize.width(context) * 0.1),
      child: Row(
        children: [
          Container(
            height: MediaQuerySize.height(context) * 0.1,
            width: MediaQuerySize.width(context) * 0.15,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://www.buro247.ua/thumb/670x830_0/images/2021/01/elon-musk-now-richest-person-01.jpg',
              ),
            ),
          ),
          Container(
            height: MediaQuerySize.height(context) * 0.1,
            margin: EdgeInsets.only(left: MediaQuerySize.width(context) * 0.07),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Иванов Иван',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text('Дата регистрации: 12.12.1212'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
