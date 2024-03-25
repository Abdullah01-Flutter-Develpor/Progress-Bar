import 'package:flutter/material.dart';
import 'package:flutter_progress_bars/widget_progress_bar.dart';

class ProgressBarWidget extends StatelessWidget {
  const ProgressBarWidget({
    super.key,
    
//circular bar
    this.startColor = Colors.amber,
    this.endColor = Colors.red,
    this.startAngle = 0,
    this.endAngle = 360,
    this.color = Colors.transparent,
    required this.userHeight,
    required this.userWidth,

//linear bar
    required this.userLinearWidth,
    required this.userLinearHeight,
    this.circluarRadius = 8,
    this.innerBarColor = Colors.lightBlue,
    this.outerBorderColor = Colors.white,
  });

  //circlar bar required
  final Color startColor;
  final Color endColor;
  final double userWidth;
  final double userHeight;
  final double endAngle;
  final Color color;
  final double startAngle;

//linear bar required
  final double userLinearWidth;
  final double userLinearHeight;
  final double circluarRadius;
  final Color outerBorderColor;
  final Color innerBarColor;

  @override
  Widget build(BuildContext context) {
    return  CircularProgressBar(
      userHeight: userHeight,
      userWidth: userWidth,
      userLinearHeight: userLinearHeight,
      userLinearWidth: userLinearWidth,
      outerBorderColor: outerBorderColor,
      innerBarColor: innerBarColor,
      circluarRadius: circluarRadius,
      startColor: startColor,
      endColor: endColor,
    );
  }
}
