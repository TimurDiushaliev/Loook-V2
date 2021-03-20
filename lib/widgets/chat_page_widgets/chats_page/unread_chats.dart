import 'package:flutter/material.dart';
import 'package:loook/responsive_size/responsive_size_provider.dart';

class UnReadChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
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
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.red[400]),
            child: Center(child: Text('13'))),
      ),
    );
  }
}
