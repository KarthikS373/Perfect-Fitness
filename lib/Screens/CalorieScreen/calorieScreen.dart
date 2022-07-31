import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../Models/Providers/healthProvider.dart';

class CalorieScreen extends StatefulWidget {
  const CalorieScreen({Key? key}) : super(key: key);

  @override
  State<CalorieScreen> createState() => _CalorieScreenState();
}

class _CalorieScreenState extends State<CalorieScreen> {
  var _calorie = 0;
  final _textController = TextEditingController();
  late SharedPreferences prefs1;
  double name1 = 0.0;
  double stps1 = 0.0;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      body: Consumer<HealthProvider>(
        builder: (context, value, child) {
          return Column(
            children: [
              Container(
                height: media.size.height * 0.4,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                ),
                child: SleekCircularSlider(
                  initialValue: (value.getSteps * 0.045),
                  appearance: CircularSliderAppearance(
                    customColors: CustomSliderColors(
                      dotColor: textColor,
                      dynamicGradient: true,
                      progressBarColor: waterColor,
                      trackColor: Colors.grey,
                    ),
                    size: media.size.height * 0.5,
                    animationEnabled: true,
                    customWidths: CustomSliderWidths(
                      progressBarWidth: 8,
                      handlerSize: 4,
                      shadowWidth: 10,
                      trackWidth: 1,
                    ),
                  ),
                  min: 0,
                  max: 100,
                  innerWidget: (double val) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "${( value.getSteps * 0.045 ).toStringAsPrecision(2)} cal",
                            style: GoogleFonts.nunito(
                              color: textColor,
                              fontSize: 30.0,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              SizedBox(
                width: media.size.width * 0.8,
                child: TextField(
                  onEditingComplete: () {
                    setState(
                          () {
                        _calorie = value.getSteps;
                        save1();
                        retrieve1();
                        stps1 = value.getSteps * 0.045;
                      },
                    );
                    _textController.clear();
                  },
                  controller: _textController,
                  cursorColor: textColor.withOpacity(0.5),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: textColor.withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: secondaryColor,
                        width: 1,
                      ),
                    ),
                    hintText: "Number of steps",
                    hintStyle: GoogleFonts.nunito(
                      color: secondaryColor,
                    ),
                  ),
                ),
              )
            ],
          );
        }
    )
    );
  }

  void save1() async {
    prefs1 = await SharedPreferences.getInstance();
    prefs1.setDouble('text1', stps1);
    retrieve1();
  }

  retrieve1() async {
    prefs1 = await SharedPreferences.getInstance();

    setState(() {
      name1 = prefs1.getDouble('text1')!;
    });
  }
}
