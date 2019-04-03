import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trillapp/ui/pages/home_page.dart';
import 'package:trillapp/ui/pages/login_page.dart';
import 'package:trillapp/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  Constants.prefs = await SharedPreferences.getInstance();
  Constants.userName = Constants.prefs.getString("name");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myApp = MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.cyan,
        brightness: Brightness.light,
        accentColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/home": (context) => HomePage(),
      },
      home: Constants.prefs.getBool("loggedIn") == true
          ? HomePage()
          : LoginPage(),
    );
    return myApp;
  }
}
