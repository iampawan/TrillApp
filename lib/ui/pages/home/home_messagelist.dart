import 'package:trillapp/ui/pages/index.dart';

class HM extends StatelessWidget {
  final List<M> mL;
  HM({this.mL});
  @override
  Widget build(c) => ListView.builder(
        itemBuilder: (c, i) => ListTile(
              title: Text(
                mL[i].m,
              ),
              subtitle: Text("${mL[i].u} says:"),
              leading: CircleAvatar(
                backgroundColor: Colors.black,
                child: Text(
                  "${mL[i].u[0]}",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        itemCount: mL.length,
      );
}
