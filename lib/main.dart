import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:chirpsdk/chirpsdk.dart';
import 'package:simple_permissions/simple_permissions.dart';

main() => runApp(MaterialApp(home: HP()));

class HP extends StatefulWidget {
  HPS createState() => HPS();
}

class HPS extends State<HP> {
  List<M> mess = List<M>();
  String un;
  var mC = TextEditingController();

  sCD(me) async {
    M m = M(u: un, m: me);
    setState(() => mess.add(m));
    await ChirpSDK.send(Uint8List.fromList(jsonEncode(m).codeUnits));
  }

  stAP() async => await ChirpSDK.stop();

  rP() async {
    if (!await SimplePermissions.checkPermission(Permission.RecordAudio))
      await SimplePermissions.requestPermission(Permission.RecordAudio);
  }

  initState() {
    super.initState();
    un = "T${Random().nextInt(5)}";
    rP();
    iC();
  }

  sCR() async {
    ChirpSDK.onReceived.listen((e) {
      print(e);
      setState(() =>
          mess.add(M.fromJson(jsonDecode(String.fromCharCodes(e.payload)))));
    });
    await ChirpSDK.start();
  }

  iN(d) async => await ChirpSDK.init(d['key'], d['secret']);

  sC(d) async => await ChirpSDK.setConfig(d['config']);

  iC() async {
    var d = jsonDecode(
        await DefaultAssetBundle.of(context).loadString("assets/config.json"));
    iN(d);
    sC(d);
    sCR();
  }

  dispose() {
    stAP();
    mC?.dispose();
    super.dispose();
  }

  build(c) {
    var colors = List.from(Colors.primaries)..shuffle();
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            child: Container(
                height: MediaQuery.of(c).size.height * 0.32,
                child:
                    AppBar(backgroundColor: colors[0], title: Text("Trill"))),
            clipper: WC(),
          ),
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemBuilder: (c, i) => ListTile(
                    title: Text(mess[i].m),
                    leading: CircleAvatar(
                      backgroundColor: colors[0],
                      foregroundColor: Colors.white,
                      child: Text("${mess[i].u}"),
                    ),
                  ),
              itemCount: mess.length,
            ),
          ),
          Container(
            height: MediaQuery.of(c).size.height * 0.1,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: mC,
              maxLength: 15,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: "Enter Message",
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    sCD(mC.text);
                    mC.clear();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class M {
  String u;
  String m;

  M({this.u, this.m});

  M.fromJson(j)
      : this.u = j['u'],
        this.m = j['m'];

  toJson() => {
        "u": u,
        "m": m,
      };
}

class WC extends CustomClipper<Path> {
  @override
  Path getClip(s) {
    var w = s.width;
    var h = s.height;
    var p = Path();
    p.lineTo(0.0, s.height - 30);
    setPath(w * 0.05, h * 0.4, w * 0.18, h - 30, p);
    setPath(w * 0.23, h, w * 0.3, h * 0.78, p);
    setPath(w * 0.35, h * 0.6, w * 0.41, h - 80, p);
    setPath(w * 0.45, h - 40, w * 0.5, h - 80, p);
    setPath(w * 0.62, h * 0.4, w * 0.65, h * 0.65, p);
    setPath(w * 0.72, h + 50, w * 0.78, h * 0.7, p);
    setPath(w * 0.85, h * 0.35, w * 0.95, h - 65, p);
    p.lineTo(w, h);
    p.lineTo(w, 0.0);
    p.close();
    return p;
  }

  bool shouldReclip(oc) => true;
}

setPath(dx1, dy1, dx2, dy2, p) {
  p.quadraticBezierTo(dx1, dy1, dx2, dy2);
}
