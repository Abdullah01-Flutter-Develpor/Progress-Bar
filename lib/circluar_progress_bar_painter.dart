import 'dart:math';

import 'package:flutter/material.dart';

class CircluarBarPainter extends CustomPainter {
  CircluarBarPainter({
    this.startAngle = 0,
    this.endAngle = 2 * pi,
    this.color = Colors.transparent,
    required this.userHeight,
    required this.userWidth,
  });
  final double userWidth;
  final double userHeight;
  final double endAngle;
  final Color color;
  final double startAngle;

  @override
  void paint(Canvas canvas, Size size) {
    
    final width = size.width;
    final height = size.height;

    final centreWidth = width / 2;
    final centreHeight = height / 2;

//centreOffset
    final centreOffset = Offset(centreWidth, centreHeight);

//radius
    final radius = min(userWidth, userHeight) / 2;

//innerCrilePaint for hiding the arc line
    final innerCirlePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    //progressCirlePaint
    final arcCriclePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = 30;

//progress arc
    canvas.drawArc(
      Rect.fromLTWH(0, 0, userWidth, userHeight),
      degToRadian(startAngle),
      degToRadian(endAngle),
      true,
      arcCriclePaint,
    );

    canvas.drawCircle(centreOffset, radius, innerCirlePaint);
  }

  @override
  bool shouldRepaint(CircluarBarPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(CircluarBarPainter oldDelegate) => true;
}

//fucntion for degree to redian
double degToRadian(double degree) => degree * pi / 180;
