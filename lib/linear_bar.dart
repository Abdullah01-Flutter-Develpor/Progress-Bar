import 'package:flutter/material.dart';

class LinearBarPainter extends CustomPainter {
  LinearBarPainter({
    required this.userLinearWidth,
    required this.userLinearHeight,
    this.circluarRadius = 8,
    this.innerBarColor = Colors.lightBlue,
    this.outerBorderColor = Colors.white,
  });

  final double userLinearWidth;
  final double userLinearHeight;
  final double circluarRadius;
  final Color outerBorderColor;
  final Color innerBarColor;

  @override
  void paint(Canvas canvas, Size size) {
    //inner rect Circle paint for lieanr progress color
    final innerRectPaint = Paint()
      ..color = innerBarColor
      ..style = PaintingStyle.fill
      ..strokeJoin = StrokeJoin.bevel;

    //outerBorderPaint for linearProgress Bar outline
    final outerBorderPaint = Paint()
      ..color = outerBorderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

//inner progress bar
    canvas.drawRRect(
        RRect.fromLTRBR(
          userLinearWidth,
          userLinearHeight,
          0,
          0,
          Radius.circular(circluarRadius),
        ),
        innerRectPaint);

//outer progress bar if you want to active this add color whatever u want
    canvas.drawRRect(
        RRect.fromLTRBR(
          size.width,
          size.height,
          0,
          0,
          Radius.circular(circluarRadius),
        ),
        outerBorderPaint);
  }

  @override
  bool shouldRepaint(LinearBarPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(LinearBarPainter oldDelegate) => true;
}
