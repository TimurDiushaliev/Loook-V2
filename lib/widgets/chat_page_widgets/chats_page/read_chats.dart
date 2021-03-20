import 'package:flutter/material.dart';

class ReadChats extends StatelessWidget {
  const ReadChats({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
            'https://lomonosov-msu.ru/media/cache/user_photo/file/user/image/source/122/121682/b_7f3f9f34c4f300945ab03e6e0b8a832980b214ed.jpg'),
      ),
      title: Text('Мария Ивановна'),
      subtitle: Text('Привет'),
    );
  }
}
