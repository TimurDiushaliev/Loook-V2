import 'package:flutter/material.dart';

class AccountBalance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kTextTabBarHeight;
    final _width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[700],
          borderRadius: BorderRadius.all(Radius.circular(25))),
      height: _height * 0.15,
      margin: EdgeInsets.only(
          top: _height * 0.05, left: _width * 0.1, right: _width * 0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Баланс',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            height: _height * 0.1,
            width: _width * 0.2,
            child: Container(
              width: _width * 0.15,
              child: Center(
                  child: Text(
                '245 KGS',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            height: _height * 0.1,
            width: _width * 0.2,
            child: Center(
                child: Container(
              width: _width * 0.15,
              child: Text(
                '203 бонуса',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            )),
          )
        ],
      ),
    );
  }
}
