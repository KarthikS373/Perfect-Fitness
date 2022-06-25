import 'dart:math';

import 'package:fitness_monitoring/Models/excersiseDB.dart';
import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:fitness_monitoring/Widgets/Indicators/circularIndicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseInfo extends StatelessWidget {
  final ExerciseModel item;

  const ExerciseInfo({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Random random = new Random();
    final media = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              item.gifUrl.toString(),
              width: media.size.width,
            ),
            Container(
              decoration: const BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 35.0,
                        horizontal: 5,
                      ),
                      child: Text(
                        item.name.toString().toUpperCase(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: textColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: media.size.width * 0.3,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.timelapse_rounded),
                              const Spacer(),
                              Text("${(max(12, random.nextInt(50)))} mins"),
                            ],
                          ),
                        ),
                        Container(
                          width: media.size.width * 0.3,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.directions_run_sharp),
                              const Spacer(),
                              Text("${(max(4, random.nextInt(16)))} reps"),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        "Target Muscles: ${item.target}",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: textColor,
                          letterSpacing: 1.3,
                          height: 2,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        CircularIndicator(
                          color: Colors.red,
                          text: "Calories",
                          icon: Icons.fire_hydrant_alt,
                        ),
                        CircularIndicator(
                          color: Colors.greenAccent,
                          text: "Fitness",
                          icon: Icons.directions_run_sharp,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
