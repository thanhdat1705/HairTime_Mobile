import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';

import 'components/chat_body.dart';

class ChatScreen extends StatelessWidget {
  final String chattingName;

  const ChatScreen({Key key, this.chattingName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body:  new ChatBody(chattingName: chattingName,),
    );
  }
}
