import 'package:flutter/material.dart';

class ScannerLinePainter extends CustomPainter {
  final double linePosition;
  final Color lineColor;

  ScannerLinePainter(
      {required this.linePosition, this.lineColor = const Color(0xffFDB623)});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = lineColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final double lineY = linePosition * size.height;

    canvas.drawLine(
      Offset(0, lineY),
      Offset(size.width, lineY),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
