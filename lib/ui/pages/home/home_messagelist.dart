import 'package:trillapp/ui/pages/index.dart';

class HM extends StatelessWidget {
  final List<M> messageList;
  HM({this.messageList});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, i) {
        return ListTile(
          title: Text(
            messageList[i].m,
          ),
          subtitle: Text("${messageList[i].u} says:"),
          leading: CircleAvatar(
            backgroundColor: Colors.black,
            child: Text(
              "${messageList[i].u[0].toUpperCase()}",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
      itemCount: messageList.length,
    );
  }
}
