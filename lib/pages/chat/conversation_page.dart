import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/chat_page_blocs/chatting_bloc.dart';
import 'package:loook/bloc/chat_page_blocs/chatting_events.dart';
import 'package:loook/bloc/chat_page_blocs/chatting_states.dart';

class ConversationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ChatttingBloc _chattingBloc = BlocProvider.of<ChatttingBloc>(context);
    TextEditingController _sendMessage = TextEditingController();
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
          BlocBuilder<ChatttingBloc, ChattingStates>(
            builder: (context, state) {
              if (state is SendMessageState) {
                return ListView.builder(
                  itemCount: state.messages.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    print('${state.messages[index].messageContent}');
                    return Container(
                      child: Align(
                        alignment: state.messages[index].messageType == 'sender'
                            ? Alignment.topRight
                            : Alignment.topLeft,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: state.messages[index].messageType == 'sender'
                                ? Colors.blue
                                : Colors.blueGrey[500],
                          ),
                          padding: EdgeInsets.all(10),
                          child: Text(state.messages[index].messageContent),
                        ),
                      ),
                    );
                  },
                );
              }
              return Container();
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
                      controller: _sendMessage,
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
                      _chattingBloc.add(
                          SendMessageEvent(senderMessage: _sendMessage.text));
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
