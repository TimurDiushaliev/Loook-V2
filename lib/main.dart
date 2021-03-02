import 'package:flutter/material.dart';
import 'package:loook/pages/chat_page.dart';
import 'package:loook/pages/home_page.dart';

void main() => runApp(MaterialApp(home:MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    PageController _pageViewController = PageController(initialPage: 0);
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: _pageViewController,
        children: [
          HomePage(),
          ChatPage(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          child: Icon(Icons.add),
          onPressed: () {}),
      bottomNavigationBar: Visibility(
        visible: visible,
        child: BottomAppBar(
            color: Colors.black87,
            shape: CircularNotchedRectangle(),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: _width * 0.001),
                  IconButton(
                      icon: Icon(Icons.home, color: Colors.grey[500]),
                      onPressed: () {
                        setState(() {
                          _pageViewController.jumpToPage(0);
                        });
                      }),
                  IconButton(
                      icon: Icon(Icons.favorite, color: Colors.grey[500]),
                      onPressed: () {}),
                  SizedBox(width: _width * 0.2),
                  IconButton(
                      icon: Icon(Icons.message, color: Colors.grey[500]),
                      onPressed: () {
                        setState(() {
                          _pageViewController.jumpToPage(1);
                        });
                      }),
                  IconButton(
                      icon: Icon(Icons.account_circle, color: Colors.grey[500]),
                      onPressed: () {}),
                  SizedBox(width: _width * 0.001),
                ],
              ),
            )),
      ),
    );
  }
}
