import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/chat_page_blocs/chatting_events.dart';
import 'package:loook/bloc/chat_page_blocs/chatting_states.dart';
import 'package:loook/repository/chat_messages.dart';

class ChatttingBloc extends Bloc<ChattingEvents, ChattingStates> {
  ChatttingBloc(ChattingStates initialState) : super(initialState);

  @override
  Stream<ChattingStates> mapEventToState(ChattingEvents event) async* {
    if (event is SendMessageEvent) {
      List<ChatMessages> messages = [
        ChatMessages(messageContent: 'Привет', messageType: 'receiver'),
      ];
      messages.add(ChatMessages(
          messageContent: event.senderMessage, messageType: 'sender'));
      yield SendMessageState(messages: messages);
    }
  }
}
