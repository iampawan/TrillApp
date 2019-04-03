import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width * 0.05, size.height * 0.4);
    var firstEndPoint = Offset(size.width * 0.18, size.height - 30);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var scp = Offset((size.width * 0.23), size.height);
    var sep = Offset(size.width * 0.3, size.height * 0.78);
    path.quadraticBezierTo(scp.dx, scp.dy, sep.dx, sep.dy);

    var secondControlPoint = Offset(size.width * 0.35, size.height * 0.6);
    var secondEndPoint = Offset(size.width * 0.41, size.height - 80);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var tcp = Offset(size.width * 0.45, size.height - 40);
    var tep = Offset(size.width * 0.5, size.height - 80);
    path.quadraticBezierTo(tcp.dx, tcp.dy, tep.dx, tep.dy);

    var fcp = Offset(size.width * 0.62, size.height * 0.4);
    var fep = Offset(size.width * 0.65, size.height * 0.65);
    path.quadraticBezierTo(fcp.dx, fcp.dy, fep.dx, fep.dy);

    var ficp = Offset(size.width * 0.72, size.height + 50);
    var fiep = Offset(size.width * 0.78, size.height * 0.7);
    path.quadraticBezierTo(ficp.dx, ficp.dy, fiep.dx, fiep.dy);

    var sicp = Offset(size.width * 0.85, size.height * 0.35);
    var siep = Offset(size.width * 0.95, size.height - 65);
    path.quadraticBezierTo(sicp.dx, sicp.dy, siep.dx, siep.dy);

    // var licp = Offset(size.width + 2, size.height - 20);
    // var liep = Offset(size.width + 20, size.height * 0.6);
    // path.quadraticBezierTo(licp.dx, sicp.dy, liep.dx, siep.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
