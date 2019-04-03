import 'package:meta/meta.dart';

class Message {
  String userName;
  String message;

  Message({@required this.userName, @required this.message});

  Message.fromJson(Map<String, dynamic> json)
      : this.userName = json['u'],
        this.message = json['m'];

  Map<String, dynamic> toJson() => {
        "u": this.userName,
        "m": this.message,
      };
}
