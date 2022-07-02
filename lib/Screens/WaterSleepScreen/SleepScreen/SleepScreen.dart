import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class SleepScreen extends StatefulWidget {
  const SleepScreen({Key? key}) : super(key: key);

  @override
  State<SleepScreen> createState() => _SleepScreenState();
}

class _SleepScreenState extends State<SleepScreen> {
  int _sleepHours = 0;
  int _sleepMins = 0;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          SleekCircularSlider(
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
            max: 24,
            initialValue: 14,
            innerWidget: (double val) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Value : $val"),
                  Image.asset(
                    "assets/Images/moon.png",
                    scale: 0.5,
                    height: media.size.height * 0.3,
                    width: media.size.height * 0.3,
                  ),
                ],
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Transform(
                transform: Matrix4.translationValues(-10, 0, 0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 65,
                  ),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    border: Border.all(
                      color: textColor,
                      width: 0.5,
                    ),
                  ),
                  child: const Text("Left"),
                ),
              ),
              Column(
                children: [
                  Text(
                    "Total Sleep time",
                    style: GoogleFonts.poppins(
                      color: Colors.white54,
                      letterSpacing: 0.5,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        _sleepHours.toString(),
                        textScaleFactor: 4,
                        style: GoogleFonts.aBeeZee(
                          color: textColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "H",
                        style: GoogleFonts.aBeeZee(
                          color: textColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        _sleepMins.toString(),
                        style: GoogleFonts.aBeeZee(
                          color: textColor,
                          fontWeight: FontWeight.w600,
                        ),
                        textScaleFactor: 4,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "M",
                        style: GoogleFonts.aBeeZee(
                          color: textColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Transform(
                transform: Matrix4.translationValues(10, 0, 0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 65,
                  ),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                    ),
                    border: Border.all(
                      color: textColor,
                      width: 0.5,
                    ),
                  ),
                  child: const Text("Right"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
