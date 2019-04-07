import 'package:flutter/material.dart';

class WC extends CustomClipper<Path> {
  @override
  Path getClip(s) {
    var w = s.width;
    var h = s.height;
    var p = Path();
    p.lineTo(0.0, s.height - 30);
    setPath(w * 0.05, h * 0.4, w * 0.18, h - 30, p);
    setPath(w * 0.23, h, w * 0.3, h * 0.78, p);
    setPath(w * 0.35, h * 0.6, w * 0.41, h - 80, p);
    setPath(w * 0.45, h - 40, w * 0.5, h - 80, p);
    setPath(w * 0.62, h * 0.4, w * 0.65, h * 0.65, p);
    setPath(w * 0.72, h + 50, w * 0.78, h * 0.7, p);
    setPath(w * 0.85, h * 0.35, w * 0.95, h - 65, p);
    p.lineTo(w, h);
    p.lineTo(w, 0.0);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(oc) => true;
}

setPath(dx1, dy1, dx2, dy2, p) {
  p.quadraticBezierTo(dx1, dy1, dx2, dy2);
}
