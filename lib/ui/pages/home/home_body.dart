import 'package:trillapp/ui/pages/index.dart';

class B extends StatelessWidget {
  final chirpData;
  final sentData;
  final List<M> messageList;

  B({this.chirpData, this.sentData, this.messageList});
  @override
  Widget build(BuildContext ctx) {
    var colors = List.from(Colors.primaries);
    colors.shuffle();
    var homeBody = Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ClipPath(
          child: Container(
            height: MediaQuery.of(ctx).size.height * 0.32,
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
          clipper: WC(),
        ),
        Expanded(
          child: HM(
            mL: messageList,
          ),
        ),
        HB(
          sendData: sentData,
        )
      ],
    );

    return homeBody;
  }
}
