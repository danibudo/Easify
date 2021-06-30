import 'package:flutter/material.dart';

class DrawCircle extends CustomPainter {
  Paint _paint;
  double _size;
  Offset _center;
  Color _color;

  DrawCircle(
      {@required double size, @required Offset center, @required Color color}) {
    _size = size;
    _center = center;
    _color = color;
    _paint = Paint()
      ..color = _color
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(_center, _size, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
