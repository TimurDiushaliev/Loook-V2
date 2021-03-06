import 'package:flutter/material.dart';
import 'package:loook/responsive_size/media_query.dart';

class AccountBalance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuerySize.height(context) * 0.07),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Column(
              children: [
                Text('500',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Text('Объявлений', style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Text('500',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Text('KGS', style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Text('500',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Text('Объявлений', style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
