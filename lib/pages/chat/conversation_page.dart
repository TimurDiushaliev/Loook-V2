import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ConversationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _messageController = TextEditingController();
    WebSocketChannel _webSocketChannel =
        IOWebSocketChannel.connect('wss://echo.websocket.org');
    List<String> _messages = [];
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
          StreamBuilder(
            stream: _webSocketChannel.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) _messages.add(snapshot.data);
              return ListView(
                children: _messages
                    .map((e) => Container(
                          child: Text(e),
                        ))
                    .toList(),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.grey[800],
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.add,
                    color: Colors.blue,
                    size: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _messageController,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Написать...',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Colors.blue,
                      size: 25,
                    ),
                    onPressed: () {
                      if (_messageController.text.isNotEmpty) {
                        _webSocketChannel.sink.add(_messageController.text);
                        _messageController.text = '';
                      }
                    },
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
