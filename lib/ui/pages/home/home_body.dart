import 'package:flutter/material.dart';
import 'package:trillapp/ui/controls/wave_clipper.dart';
import 'package:trillapp/ui/pages/home/home_bottom.dart';
import 'package:trillapp/ui/pages/home/home_messagelist.dart';
import 'package:trillapp/ui/pages/home/message.dart';

class HomeBody extends StatelessWidget {
  final chirpData;
  final sentData;
  final List<Message> messageList;

  HomeBody({this.chirpData, this.sentData, this.messageList});
  @override
  Widget build(BuildContext context) {
    var colors = List.from(Colors.primaries);
    colors.shuffle();
    var homeBody = Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ClipPath(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.32,
            child: AppBar(
              backgroundColor: colors[0],
              title: Text(
                "Trill",
                style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 3,
                  shadows: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10,
                      spreadRadius: 10,
                    )
                  ],
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
            ),
          ),
          clipper: WaveClipper(),
        ),
        Expanded(
          child: HomeMessageList(
            messageList: messageList,
          ),
        ),
        HomeBottom(
          sendData: sentData,
        )
      ],
    );

    return homeBody;
  }
}
