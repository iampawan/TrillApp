import 'package:flutter/material.dart';
import 'package:trillapp/ui/pages/home/message.dart';

class HomeMessageList extends StatelessWidget {
  final List<Message> messageList;
  HomeMessageList({this.messageList});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, i) {
        return ListTile(
          title: Text(
            messageList[i].message,
          ),
          subtitle: Text("${messageList[i].userName} says:"),
          leading: CircleAvatar(
            backgroundColor: Colors.black,
            child: Text(
              "${messageList[i].userName[0].toUpperCase()}",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
      itemCount: messageList.length,
    );
  }
}
