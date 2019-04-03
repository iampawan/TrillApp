import 'dart:typed_data';

import 'package:chirpsdk/chirpsdk.dart';
import 'package:flutter/material.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:trillapp/ui/pages/home/home_body.dart';
import 'package:trillapp/ui/pages/home/message.dart';
import 'package:trillapp/utils/constants.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  static const String route = "/home";

  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> with WidgetsBindingObserver {
  ChirpState chirpState = ChirpState.not_created;
  String chirpErrors = '';
  String chirpV = 'Unknown';
  Uint8List _chirpData = Uint8List(0);
  String message = "Pawan Says:";
  List<Message> messages;

  Future<void> _initChirp() async {
    await ChirpSDK.init(Constants.appKey, Constants.appSecret);
  }

  Future<void> _configureChirp() async {
    await ChirpSDK.setConfig(Constants.appConfig);
  }

  Future<void> _sendChirpData(String mes) async {
    Message m = Message(userName: Constants.userName, message: mes);
    String identifier = jsonEncode(m);
    var payload = new Uint8List.fromList(identifier.codeUnits);
    setState(() {
      messages.add(m);
    });
    await ChirpSDK.send(payload);
  }

  Future<void> _startAudioProcessing() async {
    await ChirpSDK.start();
  }

  Future<void> _stopAudioProcessing() async {
    await ChirpSDK.stop();
  }

  Future<void> _getChirpVersion() async {
    final String chirpVersion = await ChirpSDK.version;
    setState(() {
      chirpV = chirpVersion;
    });
  }

  Future<void> _setChirpCallbacks() async {
    ChirpSDK.onStateChanged.listen((e) {
      setState(() {
        chirpState = e.current;
      });
    });
    ChirpSDK.onSending.listen((e) {
      setState(() {
        _chirpData = e.payload;
      });
    });
    ChirpSDK.onSent.listen((e) {
      setState(() {
        _chirpData = e.payload;
      });
    });
    ChirpSDK.onReceived.listen((e) {
      _chirpData = e.payload;
      var mes = new String.fromCharCodes(_chirpData);
      try {
        Message m = Message.fromJson(jsonDecode(mes));
        setState(() {
          messages.add(m);
        });
      } catch (e) {}
    });
    ChirpSDK.onError.listen((e) {
      setState(() {
        chirpErrors = e.message;
      });
    });
  }

  Future<void> _requestPermissions() async {
    bool permission =
        await SimplePermissions.checkPermission(Permission.RecordAudio);
    if (!permission) {
      await SimplePermissions.requestPermission(Permission.RecordAudio);
    }
  }

  @override
  void initState() {
    super.initState();
    _requestPermissions();
    _initChirp();
    _configureChirp();
    _getChirpVersion();
    _setChirpCallbacks();
    _startAudioProcessing();
    messages = List<Message>();
  }

  @override
  void dispose() {
    _stopAudioProcessing();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _stopAudioProcessing();
    } else if (state == AppLifecycleState.resumed) {
      _startAudioProcessing();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget homeScaffold = Scaffold(
      resizeToAvoidBottomInset: true,
      body: HomeBody(
        chirpData: message,
        sentData: _sendChirpData,
        messageList: messages,
      ),
    );

    return homeScaffold;
  }
}
