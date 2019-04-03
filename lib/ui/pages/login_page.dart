import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trillapp/ui/pages/home_page.dart';
import 'package:trillapp/utils/constants.dart';

class LoginPage extends StatelessWidget {
  final nameController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  startApp(BuildContext context) {
    if (nameController.text.isNotEmpty) {
      Constants.prefs.setBool("loggedIn", true);
      Constants.prefs.setString("name", nameController.text);
      Constants.userName = nameController.text;
      Navigator.pushReplacementNamed(context, HomePage.route);
    } else {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Please enter name first"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var colors = List.from(Colors.primaries);
    colors.shuffle();
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      body: Container(
        color: colors[0],
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SvgPicture.asset(
                "assets/missed.svg",
                fit: BoxFit.cover,
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 1.9,
              ),
              Text(
                "Trill",
                textScaleFactor: 3,
                style: TextStyle(
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
              SizedBox(
                height: 30,
              ),
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                color: colors[0][200],
                margin: EdgeInsets.all(30),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    maxLength: 2,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Enter 2 char name",
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: FlatButton(
          clipBehavior: Clip.antiAlias,
          child: Text(
            "Start",
            textScaleFactor: 2,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            startApp(context);
          },
        ),
      ),
    );
  }
}
