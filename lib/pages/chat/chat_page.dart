import 'package:flutter/material.dart';
import 'package:loook/pages/chat/conversation_page.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';
import 'package:loook/widgets/add_advert_action_button_button/add_advert_action_button.dart';
import 'package:loook/widgets/bottom_app_bar/bottom_app_bar_navigation.dart';


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
            return GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ConversationPage()));
              },
              child: Column(
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
                          width: ResponsiveSizeProvider.width(context) * 0.1,
                          height: ResponsiveSizeProvider.height(context) * 0.04,
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
              ),
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
