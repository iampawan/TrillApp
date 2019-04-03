import 'index.dart';

class HP extends StatefulWidget {
  static String route = "/home";

  @override
  HPState createState() {
    return HPState();
  }
}

class HPState extends State<HP> with WidgetsBindingObserver {
  ChirpState chirpState = ChirpState.not_created;
  String chirpErrors = '';
  String chirpV = '?';
  Uint8List _chirpData = Uint8List(0);
  String message = "";
  List<M> messages;

  Future<void> _initChirp() async {
    await ChirpSDK.init(Const.appKey, Const.appSecret);
  }

  Future<void> _configureChirp() async {
    await ChirpSDK.setConfig(Const.appConfig);
  }

  Future<void> _sendChirpData(String mes) async {
    M m = M(u: Const.un, m: mes);
    String identifier = jsonEncode(m);
    var payload = Uint8List.fromList(identifier.codeUnits);
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
      var mes = String.fromCharCodes(_chirpData);
      try {
        M m = M.fromJson(jsonDecode(mes));
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
    _setChirpCallbacks();
    _startAudioProcessing();
    messages = List<M>();
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
  Widget build(BuildContext c) {
    return Scaffold(
      body: B(
        chirpData: message,
        sentData: _sendChirpData,
        messageList: messages,
      ),
    );
  }
}
