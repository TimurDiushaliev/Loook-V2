import 'package:flutter/cupertino.dart';
import 'package:loook/repository/chat_messages.dart';

abstract class ChattingStates {}

class SendMessageState extends ChattingStates {
  List<ChatMessages> messages;
  SendMessageState({@required this.messages});
}

class NoMessagesState extends ChattingStates {}
