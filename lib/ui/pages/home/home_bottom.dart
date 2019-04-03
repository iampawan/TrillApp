import 'package:flutter/material.dart';

class HomeBottom extends StatefulWidget {
  final sendData;

  HomeBottom({this.sendData});

  @override
  _HomeBottomState createState() => _HomeBottomState();
}

class _HomeBottomState extends State<HomeBottom> {
  TextEditingController messageController;
  @override
  void initState() {
    super.initState();
    messageController = TextEditingController();
    messageController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    messageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var myBottom = Theme(
      data: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.black,
        cursorColor: Colors.black,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: messageController,
                maxLength: 15,
                style: TextStyle(
                  color: Colors.black,
                ),
                // onEditingComplete: sendData(messageController.text),
                autofocus: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Enter Message",
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.send,
                    ),
                    onPressed: messageController.text.isNotEmpty
                        ? () {
                            widget.sendData(messageController.text);
                            messageController.clear();
                          }
                        : null,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return myBottom;
  }
}
