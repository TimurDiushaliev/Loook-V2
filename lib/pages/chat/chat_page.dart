import 'package:flutter/material.dart';
import 'package:loook/responsive_size/media_query.dart';
import 'package:loook/widgets/bottom_app_bar/bottom_app_bar_navigation.dart';
import 'package:loook/widgets/floating_action_buttom/add_advert_action_button.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                        width: MediaQuerySize.width(context) * 0.1,
                        height: MediaQuerySize.height(context) * 0.04,
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
        floatingActionButton: AddAdvertActionButton(),
        bottomNavigationBar: BottomAppBarNavigation(),
      ),
    );
  }
}
