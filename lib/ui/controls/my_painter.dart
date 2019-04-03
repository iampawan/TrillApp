import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint()
      ..color = Colors.green
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(Offset(size.width - size.width * 0.1, 10.0), 10, p);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

// Expanded(
//             child: LayoutBuilder(
//               builder: (ctx, constraints) => Stack(
//                     fit: StackFit.loose,
//                     children: <Widget>[
//                       Positioned(
//                         top: Random().nextDouble() * constraints.maxHeight,
//                         left: Random().nextDouble() * constraints.maxWidth,
//                         child: CustomPaint(
//                           foregroundPainter: MyPainter(),
//                           child: AnimatedContainer(
//                             height: 80.0,
//                             width: 80.0,
//                             duration: Duration(seconds: 2),
//                             padding: EdgeInsets.all(15),
//                             decoration: BoxDecoration(
//                               color: Color(
//                                   0xff000000 + Random().nextInt(0x00ffffff)),
//                               borderRadius: BorderRadius.circular(50),
//                               border: Border.all(
//                                 color: Colors.black,
//                                 width: 1.0,
//                               ),
//                               image: DecorationImage(
//                                 image: NetworkImage(
//                                   "https://images.ctfassets.net/6rsj5ae0g75g/6nf3rNaaVaUqYcoAcciSeC/a43b6f3da7352837e0db54dc86339420/Last_few_hours_more_for_FlutterLive._Join_us_from_anywhere_around_the_world._Flutter_Excitement_flutterio.jpg?w=450&fl=progressive&q=100",
//                                 ),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         top: Random().nextDouble() * constraints.maxHeight,
//                         left: Random().nextDouble() * constraints.maxWidth,
//                         child: CustomPaint(
//                           foregroundPainter: MyPainter(),
//                           child: AnimatedContainer(
//                             height: 80.0,
//                             width: 80.0,
//                             duration: Duration(seconds: 2),
//                             padding: EdgeInsets.all(15),
//                             decoration: BoxDecoration(
//                               color: Color(
//                                   0xff000000 + Random().nextInt(0x00ffffff)),
//                               borderRadius: BorderRadius.circular(50),
//                               border: Border.all(
//                                 color: Colors.black,
//                                 width: 1.0,
//                               ),
//                               image: DecorationImage(
//                                 image: NetworkImage(
//                                   "https://images.pexels.com/photos/36029/aroni-arsa-children-little.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
//                                 ),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//             ),
//           )
