import 'dart:math';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    // double random = min(0.2, Random().nextDouble());
    double random = 0.5;
    return CircularPercentIndicator(
      radius: 60,
      lineWidth: 12,
      percent: random,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: color.withOpacity(0.6),
      backgroundColor: Colors.grey.withOpacity(0.2),
      animation: true,
      animateFromLastPercent: true,
      animationDuration: 1200,
      startAngle: 210,
      center: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          Text(text),
        ],
      ),
    );
  }
}
