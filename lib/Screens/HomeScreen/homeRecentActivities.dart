import 'dart:math';

import 'package:fitness_monitoring/Models/recentActivities.dart';
import 'package:fitness_monitoring/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomeRecentActivities extends StatefulWidget {
  const HomeRecentActivities({Key? key}) : super(key: key);

  @override
  State<HomeRecentActivities> createState() => _HomeRecentActivitiesState();
}

class _HomeRecentActivitiesState extends State<HomeRecentActivities> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recent Activities",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                Text("Activity"),
                Spacer(
                  flex: 2,
                ),
                Text("Date"),
                Spacer(),
                Text("Calories"),
              ],
            ),
            Container(
              width: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width * 0.85
                  : MediaQuery.of(context).size.width * 0.95,
              height: 0.5,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 7.5,
                    ),
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal:
                            BorderSide(color: Colors.grey.withOpacity(0.1)),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(recentActivities[index].name),
                        const Spacer(
                          flex: 2,
                        ),
                        Text(
                          DateFormat('dd-MM-y')
                              .format(recentActivities[index].time),
                        ),
                        const Spacer(),
                        Text(
                          "${recentActivities[index].caloriesBurnt} cal",
                        ),
                      ],
                    ),
                  );
                },
                itemCount: min(recentActivities.length, 6),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.3456,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                border: Border.all(
                  color: primaryColor,
                  style: BorderStyle.solid,
                  width: 0.4,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "More",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: textColor,
                    ),
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
