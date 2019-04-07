import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:chirpsdk/chirpsdk.dart';
import 'package:trillapp/ui/controls/wave_clipper.dart';
import 'package:trillapp/ui/pages/home/message.dart';
import 'package:simple_permissions/simple_permissions.dart';

class HP extends StatefulWidget {
  @override
  HPS createState() => HPS();
}

class HPS extends State<HP> {
  ChirpState chirpState = ChirpState.not_created;
  String chirpErrors = '', chirpV = '?', m = "";
  Uint8List _chirpData = Uint8List(0);
  List<M> mess = List<M>();
  String un;
  var messageController = TextEditingController();

  iC() async {
    await ChirpSDK.init("c2fBB0f08890eA68B705e8e4b",
        "d4abcDBa75F3beBD78Bb4DcC30cEf1CeFa1E3A57F0FfC1C7D3");
  }

  cC() async {
    await ChirpSDK.setConfig(
        "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");
  }

  sCD(me) async {
    M m = M(u: un, m: me);
    String identifier = jsonEncode(m);
    setState(() {
      mess.add(m);
    });
    await ChirpSDK.send(Uint8List.fromList(identifier.codeUnits));
  }

  sAP() async {
    await ChirpSDK.start();
  }

  stAP() async {
    await ChirpSDK.stop();
  }

  sCC() async {
    ChirpSDK.onReceived.listen((e) {
      _chirpData = e.payload;
      try {
        M m = M.fromJson(jsonDecode(String.fromCharCodes(_chirpData)));
        setState(() {
          mess.add(m);
        });
      } catch (e) {}
    });
    ChirpSDK.onError.listen((e) {
      setState(() {
        chirpErrors = e.message;
      });
    });
  }

  rP() async {
    bool pr = await SimplePermissions.checkPermission(Permission.RecordAudio);
    if (!pr) {
      await SimplePermissions.requestPermission(Permission.RecordAudio);
    }
  }

  @override
  void initState() {
    super.initState();
    un = "pk${Random().nextInt(5)}";
    rP();
    iC();
    cC();
    sCC();
    sAP();
  }

  @override
  void dispose() {
    stAP();
    super.dispose();
  }

  @override
  Widget build(c) {
    var colors = List.from(Colors.primaries);
    colors.shuffle();
    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipPath(
            child: Container(
              height: MediaQuery.of(c).size.height * 0.32,
              child: AppBar(
                backgroundColor: colors[0],
                title: Text(
                  "Trill",
                ),
              ),
            ),
            clipper: WC(),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (c, i) => ListTile(
                    title: Text(
                      mess[i].m,
                    ),
                    leading: CircleAvatar(
                      child: Text(
                        "${mess[i].u}",
                      ),
                    ),
                  ),
              itemCount: mess.length,
            ),
          ),
          Container(
            height: MediaQuery.of(c).size.height * 0.1,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: TextField(
              controller: messageController,
              maxLength: 15,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Enter Message",
                suffixIcon: IconButton(
                    icon: Icon(
                      Icons.send,
                    ),
                    onPressed: () {
                      sCD(messageController.text);
                      messageController.clear();
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
