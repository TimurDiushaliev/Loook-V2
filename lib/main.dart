import 'package:flutter/material.dart';
import 'package:loook/pages/home_page.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: HomePage(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          child: Icon(Icons.add),
          onPressed: () {}),
      bottomNavigationBar: BottomAppBar(
          color: Colors.black87,
          shape: CircularNotchedRectangle(),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: _width * 0.001),
                IconButton(
                    icon: Icon(Icons.home, color: Colors.grey[500]),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(Icons.favorite, color: Colors.grey[500]),
                    onPressed: () {}),
                SizedBox(width: _width * 0.2),
                IconButton(
                    icon: Icon(Icons.message, color: Colors.grey[500]),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(Icons.account_circle, color: Colors.grey[500]),
                    onPressed: () {}),
                SizedBox(width: _width * 0.001),
              ],
            ),
          )),
    );
  }
}
