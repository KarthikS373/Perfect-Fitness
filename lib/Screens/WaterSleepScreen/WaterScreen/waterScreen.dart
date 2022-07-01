import 'dart:math';

import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class WaterScreen extends StatefulWidget {
  const WaterScreen({Key? key}) : super(key: key);

  @override
  State<WaterScreen> createState() => _WaterScreenState();
}

class _WaterScreenState extends State<WaterScreen> {
  int glassCount = 10;
  int drinkCount = 0;

  final List<Map<String, dynamic>> _drinks = [];

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          SizedBox(
            height: media.size.height * 0.3,
            width: media.size.height * 0.3,
            child: LiquidCircularProgressIndicator(
              value: min((drinkCount / 10), 1),

              valueColor: const AlwaysStoppedAnimation(waterColor),
              borderColor: secondaryColor,
              backgroundColor: secondaryColor,
              borderWidth: 0,
              direction: Axis.vertical,
              center: Text(
                "${min((drinkCount / 10), 1) * 100}%",
                style: GoogleFonts.aBeeZee(
                  color: textColor,
                  fontSize: 28,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 0,
            ),
            margin: const EdgeInsets.only(
              top: 30,
            ),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: () {
                    if (index > drinkCount - 1) {
                      setState(
                            () {
                          drinkCount++;
                        },
                      );
                      _drinks.add(
                        {
                          "Quantity": "100ml",
                          "Time": DateTime.now(),
                        },
                      );
                    } else {
                      setState(
                            () {
                          drinkCount--;
                        },
                      );
                      _drinks.removeLast();
                    }
                  },
                  onLongPress: () {
                    if (index >= drinkCount) {
                      setState(
                            () {
                          glassCount--;
                        },
                      );
                    }
                  },
                  child: Container(
                    height: 20,
                    width: 10,
                    decoration: BoxDecoration(
                      color: index <= drinkCount - 1
                          ? waterColor
                          : secondaryColor.withOpacity(0.8),
                    ),
                    child: index == glassCount - 1
                        ? IconButton(
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white54,
                      ),
                      onPressed: () {
                        setState(
                              () {
                            glassCount++;
                          },
                        );
                      },
                    )
                        : null,
                  ),
                );
              },
              itemCount: glassCount,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            width: media.size.width * 0.9,
            decoration: const BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: _drinks.isEmpty
                  ? const Center(
                child: Text("Nothing to show here"),
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Water Intake",
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
                      Text("Quantity"),
                      Spacer(
                        flex: 2,
                      ),
                      Text("Time"),
                      Spacer(),
                    ],
                  ),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.95,
                    height: 0.5,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 7.5,
                        ),
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                                color: Colors.grey.withOpacity(0.1)),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(_drinks[index]['Quantity']!),
                            const Spacer(
                              flex: 2,
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Text(
                              DateFormat('')
                                  .add_jm()
                                  .format(_drinks[index]['Time']),
                            ),
                            const Spacer(),
                          ],
                        ),
                      );
                    },
                    itemCount: _drinks.length,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
