import 'package:flutter/cupertino.dart';

abstract class ChattingEvents {}

class SendMessageEvent extends ChattingEvents {
  String senderMessage;
  SendMessageEvent({@required this.senderMessage});
}
