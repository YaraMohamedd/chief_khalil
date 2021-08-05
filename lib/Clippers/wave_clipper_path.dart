import 'package:flutter/material.dart';

class BottomWaveClipper extends CustomClipper<Path> {

  @override

  Path getClip(Size size) {

    var path = new Path();

    path.lineTo(0.0, size.height - 40);

    path.quadraticBezierTo(

        size.width / 4, size.height - 170, size.width / 2, size.height - 90);

    path.quadraticBezierTo(size.width - (size.width / 5), size.height,

        size.width, size.height - 30);

    path.lineTo(size.width, 0.0);

    path.close();

    return path;

  }

  @override

  bool shouldReclip(CustomClipper<Path> oldClipper) {

    return false;

  }

}