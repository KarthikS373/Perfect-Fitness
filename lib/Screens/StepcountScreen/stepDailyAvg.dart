import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:fitness_monitoring/Widgets/Cards/circularCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StepDailyAvg extends StatelessWidget {
  const StepDailyAvg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Daily average :",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 26,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CircularGraphCard(
                    "SUN",
                    0.7,
                    Colors.red,
                  ),
                  CircularGraphCard(
                    "MON",
                    0.1,
                    Colors.cyan,
                  ),
                  CircularGraphCard(
                    "TUE",
                    0.2,
                    Colors.teal,
                  ),
                  CircularGraphCard(
                    "WED",
                    0.3,
                    Colors.amber,
                  ),
                  CircularGraphCard(
                    "THUR",
                    0.4,
                    Colors.green,
                  ),
                  CircularGraphCard(
                    "FRI",
                    0.5,
                    Colors.indigo,
                  ),
                  CircularGraphCard(
                    "SAT",
                    0.6,
                    Colors.purple,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
