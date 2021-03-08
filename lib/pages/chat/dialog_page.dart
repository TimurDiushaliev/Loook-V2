import 'package:flutter/material.dart';

class DialogPage extends StatelessWidget {
  const DialogPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://lomonosov-msu.ru/media/cache/user_photo/file/user/image/source/122/121682/b_7f3f9f34c4f300945ab03e6e0b8a832980b214ed.jpg'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Мария Ивановна',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              color: Colors.grey[800],
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.add,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        focusColor: Colors.blue, hintText: 'Написать...'),
                  )),
                  Icon(
                    Icons.send,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
