import 'package:flutter/material.dart';

class WC extends CustomClipper<Path> {
  @override
  Path getClip(s) {
    var path = Path();
    path.lineTo(0.0, s.height - 30);
    var fc = O(s.width * 0.05, s.height * 0.4);
    var fe = O(s.width * 0.18, s.height - 30);
    path.quadraticBezierTo(fc.dx, fc.dy, fe.dx, fe.dy);
    var sc = O((s.width * 0.23), s.height);
    var se = O(s.width * 0.3, s.height * 0.78);
    path.quadraticBezierTo(sc.dx, sc.dy, se.dx, se.dy);
    var tc = O(s.width * 0.35, s.height * 0.6);
    var te = O(s.width * 0.41, s.height - 80);
    path.quadraticBezierTo(tc.dx, tc.dy, te.dx, te.dy);
    var foc = O(s.width * 0.45, s.height - 40);
    var fop = O(s.width * 0.5, s.height - 80);
    path.quadraticBezierTo(foc.dx, foc.dy, fop.dx, fop.dy);
    var fic = O(s.width * 0.62, s.height * 0.4);
    var fip = O(s.width * 0.65, s.height * 0.65);
    path.quadraticBezierTo(fic.dx, fic.dy, fip.dx, fip.dy);
    var sic = O(s.width * 0.72, s.height + 50);
    var sip = O(s.width * 0.78, s.height * 0.7);
    path.quadraticBezierTo(sic.dx, sic.dy, sip.dx, sip.dy);
    var sec = O(s.width * 0.85, s.height * 0.35);
    var sep = O(s.width * 0.95, s.height - 65);
    path.quadraticBezierTo(sec.dx, sec.dy, sep.dx, sep.dy);
    path.lineTo(s.width, s.height);
    path.lineTo(s.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(oc) => true;
}

mixin Ofs {}

class O = Offset with Ofs;
