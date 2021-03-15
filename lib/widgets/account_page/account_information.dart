import 'package:flutter/material.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class AccountInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: ResponsiveSizeProvider.height(context) * 0.05,
          left: ResponsiveSizeProvider.width(context) * 0.1),
      child: Row(
        children: [
          Container(
            height: ResponsiveSizeProvider.height(context) * 0.1,
            width: ResponsiveSizeProvider.width(context) * 0.15,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://www.buro247.ua/thumb/670x830_0/images/2021/01/elon-musk-now-richest-person-01.jpg',
              ),
            ),
          ),
          Container(
            height: ResponsiveSizeProvider.height(context) * 0.1,
            margin: EdgeInsets.only(left: ResponsiveSizeProvider.width(context) * 0.07),
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
