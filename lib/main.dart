import 'package:trillapp/ui/pages/index.dart';

main() async {
  Const.prefs = await SharedPreferences.getInstance();
  Const.un = Const.prefs.getString("name");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(c) {
    return MaterialApp(
      routes: {
        "/home": (c) => HP(),
      },
      home: Const.prefs.getBool("logged") == true ? HP() : LP(),
    );
  }
}
