import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularGraphCard extends StatelessWidget {
  String day;
  double percentage;
  Color colors;

  CircularGraphCard(this.day, this.percentage, this.colors, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          children: [
            CircularPercentIndicator(
              radius: 30.0,
              lineWidth: 2.0,
              animation: true,
              percent: percentage,
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: colors,
            ),
            Text(
              day,
              style: const TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
