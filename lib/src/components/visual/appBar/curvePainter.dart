import 'package:flutter/material.dart';


class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Color.fromRGBO(235, 236, 240, 1);
    //paint.style = PaintingStyle.fill;
    var path = Path();
    path.moveTo(0, size.height * 0.9);
    path.quadraticBezierTo(size.width * 0.09, size.height * 0.7,
        size.width * 0.5, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.8, size.height * 0.79,
        size.width, size.height * 0.49);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    //canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}