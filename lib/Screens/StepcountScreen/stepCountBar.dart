import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:fitness_monitoring/Widgets/Buttons/containerButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/Providers/healthProvider.dart';

class StepCountBar extends StatelessWidget {
  int steps;
  double miles, calories, duration;
  HealthProvider value;
  int name;

  StepCountBar(this.steps, this.miles, this.calories, this.duration, this.value, this.name, {Key? key})
      : super(key: key);

  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: (){
          print(name);
          // reset();
          print(name);
        },
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          children: [
                            SizedBox(
                              width: 150,
                              child: Row(
                                children: [
                                  Text(
                                    steps.toString(),
                                    style: GoogleFonts.aBeeZee(
                                      color: Colors.white,
                                      fontSize: 55,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(
                                    Icons.directions_walk_outlined,
                                    color: Colors.white,
                                    size: 25,
                                  )
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(70),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    "Pause",
                                    style: GoogleFonts.aBeeZee(
                                      color: Colors.green,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 130,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LinearPercentIndicator(
                    percent: (value.getSteps)/100,
                    progressColor: Colors.green,

                    lineHeight: 20,
                    animation: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  reset() async{
    prefs = await SharedPreferences.getInstance();
      await prefs.setInt('text', 0);
      value.stepps = 0;
      name = 0;
      // retrieve();
  }
}
