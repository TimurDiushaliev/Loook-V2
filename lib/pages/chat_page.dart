import 'package:flutter/material.dart';
import 'package:loook/widgets/bottom_app_bar/bottom_app_bar_actions.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: Text('Чаты'),
        ),
        body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://lomonosov-msu.ru/media/cache/user_photo/file/user/image/source/122/121682/b_7f3f9f34c4f300945ab03e6e0b8a832980b214ed.jpg'),
                    ),
                    title: Text('Мария Ивановна'),
                    subtitle: Text('Привет'),
                    trailing: Container(
                        width: _width * 0.1,
                        height: _height * 0.04,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red[400]),
                        child: Center(child: Text('13'))),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://lomonosov-msu.ru/media/cache/user_photo/file/user/image/source/122/121682/b_7f3f9f34c4f300945ab03e6e0b8a832980b214ed.jpg'),
                  ),
                  title: Text('Мария Ивановна'),
                  subtitle: Text('Привет'),
                ),
              ],
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.red,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {}),
        bottomNavigationBar: BottomAppBarActions(),
      ),
    );
  }
}
