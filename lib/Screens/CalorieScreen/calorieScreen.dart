import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:animations/animations.dart';

import '../../Models/Providers/healthProvider.dart';
import '../../Models/meal.dart';
import 'meal_detail_screen.dart';

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
        body: Consumer<HealthProvider>(builder: (context, value, child) {
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
                        "${(value.getSteps * 0.045).toStringAsPrecision(2)} cal",
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
          SizedBox(
            height: 40,
          ),
          const SizedBox(
            height: 50,
            child : Text(
              "MEALS FOR TODAY",
              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 32,
                  ),
                  for (int i = 0; i < meals.length; i++)
                    _MealCard(
                      meal: meals[i],
                      key: null,
                    ),
                ],
              ),
            ),
          ),
        ],
      );
    }));
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

class _MealCard extends StatelessWidget {
  final Meal meal;

  const _MealCard({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 20,
        bottom: 10,
      ),
      child: Material(
        borderRadius: BorderRadius.all(
          Radius.circular(20),

        ),
        elevation: 4,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,

          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: OpenContainer(
                closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                transitionDuration: const Duration(milliseconds: 1000),
                openBuilder: (context, _) {
                  return MealDetailScreen(
                    meal: meal,
                  );
                },
                closedBuilder: (context, openContainer) {
                  return GestureDetector(
                    onTap: openContainer,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        meal.imagePath,
                        width: 200,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      meal.mealTime,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Text(
                      meal.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "${meal.kiloCaloriesBurnt} kcal",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          size: 15,
                          color: Colors.black12,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "${meal.timeTaken} min",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
