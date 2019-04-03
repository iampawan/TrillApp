import 'index.dart';

class LP extends StatelessWidget {
  final nC = TextEditingController();
  final sK = GlobalKey<ScaffoldState>();

  start(cx) {
    if (nC.text.isNotEmpty) {
      Const.prefs.setBool("logged", true);
      Const.prefs.setString("name", nC.text);
      Const.un = nC.text;
      Navigator.pushReplacementNamed(cx, HP.route);
    } else {
      sK.currentState.showSnackBar(SnackBar(
        content: Text("Enter name first"),
      ));
    }
  }

  @override
  Widget build(cx) {
    var colors = List.from(Colors.primaries);
    colors.shuffle();
    return Scaffold(
      key: sK,
      body: Container(
        color: colors[0],
        height: MediaQuery.of(cx).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SvgPicture.asset(
                "assets/missed.svg",
                fit: BoxFit.cover,
                alignment: Alignment.center,
                height: MediaQuery.of(cx).size.height / 1.9,
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
                    controller: nC,
                    maxLength: 2,
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
          child: Text(
            "Start",
            textScaleFactor: 2,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          onPressed: () => start(cx),
        ),
      ),
    );
  }
}
