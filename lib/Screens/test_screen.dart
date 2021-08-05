import 'package:flutter/material.dart';
class Contact extends StatelessWidget {
  final double height;

  const Contact({Key key, this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: RoundedClipper(height),
            child: Container(
              color: Colors.orange,
              height: 300,
              width: double.infinity,
            )
          )
        ],
      ),
    );
  }
}

class RoundedClipper extends CustomClipper<Path> {
  final double height;
  RoundedClipper(this.height);
  @override
  Path getClip(Size size) {
      var path = Path();
      path.lineTo(0.0, height - 200);
      path.quadraticBezierTo(
      size.width / 2,
      height,
      size.width,
      height - 200,
    );
      path.lineTo(size.width, 0.0);
      path.close();
      return path;
  }
    @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
