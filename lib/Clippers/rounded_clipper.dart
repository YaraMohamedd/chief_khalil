import 'package:flutter/material.dart';

class RoundedClipper extends CustomClipper<Path> {
  final double height;
  RoundedClipper(this.height);
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, height - 400);
    path.quadraticBezierTo(
      size.width / 2,
      height,
      size.width,
      height - 200,
    );
    path.lineTo(size.width, 20);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}