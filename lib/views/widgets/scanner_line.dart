import 'package:flutter/material.dart';

import 'scanner_line_painter.dart';

class ScannerLine extends StatefulWidget {
  final double height;
  final Color lineColor;

  const ScannerLine({
    super.key,
    required this.height,
    this.lineColor = const Color(0xffFDB623),
  });

  @override
  State<ScannerLine> createState() => _ScannerLineState();
}

class _ScannerLineState extends State<ScannerLine>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          painter: ScannerLinePainter(
            linePosition: _animation.value,
            lineColor: widget.lineColor,
          ),
          size: Size(double.infinity, widget.height),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
