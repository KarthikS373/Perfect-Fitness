import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:flutter/material.dart';

class MaterialSecCard extends StatelessWidget {
  final bgColor, borderColor, child;
  final height, width;
  final borderRadius;

  const MaterialSecCard({
    Key? key,
    this.bgColor = secondaryColor,
    this.borderColor = textColor,
    this.child = const Text("Text"),
    this.height = null,
    this.width = null,
    this.borderRadius = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.symmetric(
        vertical: 25,
        horizontal: 50,
      ),
      decoration: BoxDecoration(
        color: bgColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor,
          width: 0.5,
        ),
      ),
      child: child,
    );
  }
}
