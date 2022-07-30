import 'dart:math';

import 'package:fitness_monitoring/Models/Providers/healthProvider.dart';
import 'package:fitness_monitoring/Screens/StepcountScreen/stepCountBar.dart';
import 'package:fitness_monitoring/Screens/StepcountScreen/stepDailyAvg.dart';
import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:fitness_monitoring/Widgets/Text/clickableTextHeader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StepcountScreen extends StatefulWidget {
  const StepcountScreen({Key? key}) : super(key: key);

  @override
  State<StepcountScreen> createState() => _StepcountScreenState();
}

class _StepcountScreenState extends State<StepcountScreen> {
  int name = 0;
  TextEditingController controller = TextEditingController();
  late SharedPreferences prefs;

  int stps = 0;
  int finalval = 0;
  double x = 0.0;
  double y = 0.0;
  double z = 0.0;
  double miles = 0.0;
  double duration = 0.0;
  double calories = 0.0;
  double addValue = 0.025;
  int steps = 0;
  int cc = 0;
  double previousDistance = 0.0;
  double distance = 0.0;

  @override
  void initState()
  {
    super.initState();
    retrieve();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HealthProvider>(
        builder: (context, value, child) {
          return StreamBuilder<AccelerometerEvent>(
            stream: SensorsPlatform.instance.accelerometerEvents,
            builder: (context, snapShort) {
              if (snapShort.hasData) {
                x = snapShort.data!.x;
                y = snapShort.data!.y;
                z = snapShort.data!.z;
                distance = getValue(x, y, z);
                 value.stepps = name;
                if (distance > 6) {
                  value.incrementSteps();
                  name = value.getSteps;
                  save();
                }

                calories = calculateCalories(steps);
                duration = calculateDuration(steps);
                miles = calculateMiles(steps);
              }
              return Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          bgColor,
                          bgColor,
                          Colors.black12,
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 1.55,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: kToolbarHeight,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            children: [
                              ClickableTextHeader(
                                "Today",
                                true,
                                () {
                                  print("This was tapped");
                                },
                              ),
                              ClickableTextHeader(
                                "Plan",
                                false,
                                () {
                                  print("This was tapped");
                                },
                              ),
                              ClickableTextHeader(
                                "Daily",
                                false,
                                () {
                                  print("This was tapped");
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 4,
                          ),
                          child: StepCountBar(name, miles, calories, duration, value,name),
                        ),
                      IconButton(
                          onPressed: ()
                          {
                             delete();
                            print("kk");
                          },

                          icon: Icon( Icons.refresh, size: 35.0)),

                        const StepDailyAvg(),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  double getValue(double x, double y, double z) {
    double magnitude = sqrt(x * x + y * y + z * z);
    getPreviousValue();
    double modDistance = magnitude - previousDistance;
    setPreviousValue(magnitude);
    return modDistance;
  }

  void setPreviousValue(double distance) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setDouble("preValue", distance);
  }

  void getPreviousValue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      previousDistance = pref.getDouble("preValue") ?? 0.0;
    });
  }

  // void calculate data
  double calculateMiles(int steps) {
    double milesValue = (2.2 * steps) / 5280;
    return milesValue;
  }

  double calculateDuration(int steps) {
    double durationValue = (steps * 1 / 1000);
    return durationValue;
  }

  double calculateCalories(int steps) {
    double caloriesValue = (steps * 0.0566);
    return caloriesValue;
  }

  void save() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setInt('text', name);
    // retrieve();
  }

  retrieve() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
     name = prefs.getInt('text')!;
    });
  }

  // reset() async{
  //   prefs = await SharedPreferences.getInstance();
  //   await prefs.setInt('text', 0);
  //   // retrieve();
  // }
   delete() async{
    prefs = await SharedPreferences.getInstance();
    prefs.remove('text');
    name = 0;
    setState(() {});
   }
}
