import 'package:flutter/material.dart';
import 'package:flutter_progress_bars/bar_painter.dart';

import 'package:flutter_progress_bars/linear_bar.dart';

class CircularProgressBar extends StatefulWidget {
  const CircularProgressBar({
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
  State<CircularProgressBar> createState() => _CircularProgreeBarState();
}

class _CircularProgreeBarState extends State<CircularProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<Color?> colorAnimation;
  late Animation<double> widthAnimation;
  late Animation<int> textAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 9),
    )
      ..addListener(() {
        setState(() {});
      })
      ..repeat();
    animation = Tween<double>(begin: widget.startAngle, end: widget.endAngle)
        .animate(animationController);

    colorAnimation = ColorTween(begin: widget.startColor, end: widget.endColor)
        .animate(animationController);
    widthAnimation = Tween<double>(begin: 0.0, end: widget.userLinearWidth)
        .animate(animationController);
    textAnimation = IntTween(begin: 0, end: 100).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  painter: CircluarBarPainter(
                    userWidth: 150,
                    userHeight: 150,
                    endAngle: animation.value,
                    color: colorAnimation.value!,
                    startAngle: widget.startAngle,
                  ),
                  child: const SizedBox(
                    width: 150,
                    height: 150,
                  ),
                ),
                Text(
                  '${textAnimation.value}%',
                  style: const TextStyle(
                      fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            width: 300,
            height: widget.userLinearHeight,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  painter: LinearBarPainter(
                    userLinearWidth: widthAnimation.value,
                    userLinearHeight: widget.userLinearHeight,
                    outerBorderColor: widget.outerBorderColor,
                    innerBarColor: widget.innerBarColor,
                    circluarRadius: widget.circluarRadius,
                  ),
                  child: SizedBox(
                    width: 300,
                    height: widget.userLinearHeight,
                  ),
                ),
                Text(
                  '${textAnimation.value}%',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
