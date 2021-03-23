import 'package:flutter/material.dart';
import 'package:loook/pages/chat/conversation_page.dart';
import 'package:loook/widgets/bottom_app_bar_widget/bottom_app_bar_navigation.dart';
import 'package:loook/widgets/chat_page_widgets/chats_page/read_chats.dart';
import 'package:loook/widgets/chat_page_widgets/chats_page/unread_chats.dart';
import 'package:loook/widgets/navigate_to_add_advert_pages_button/navigate_to_add_advert_pages_button.dart';

class ChatsPage extends StatelessWidget {
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConversationPage(),
                  ),
                );
              },
              child: Column(
                children: [
                  UnReadChats(),
                  ReadChats(),
                ],
              ),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton:NavigateToAddAdvertPages(),
        bottomNavigationBar: BottomAppBarNavigation(),
      ),
    );
  }
}
