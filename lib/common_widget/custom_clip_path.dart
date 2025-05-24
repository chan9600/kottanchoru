import 'package:flutter/material.dart';

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    // path.lineTo(0, 470);
    // path.quadraticBezierTo(600, -380, 1000, 3600);
    // path.lineTo(width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, height);
    path.lineTo(900, height);
    path.quadraticBezierTo(0, 40, 200, 500);
    path.lineTo(-100, height);
    path.lineTo(width, height);
    path.lineTo(width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
