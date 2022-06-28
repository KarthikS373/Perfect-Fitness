import 'dart:async';
import 'dart:convert';

import 'package:fitness_monitoring/Models/excersiseDB.dart';
import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({Key? key}) : super(key: key);

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return Scaffold(
      body: FutureBuilder(
        builder: (ctx, data) {
          if (data.hasError) {
            return Center(
              child: Text("NO DATA FOUND ${data.error}"),
            );
          } else if (data.hasData) {
            var items = data.data as List<ExerciseModel>;

            final List<String> exerciseList = [
              "waist",
              "chest",
              "upper legs",
              "lower legs",
              "upper arms",
              "lower arms",
              "cardio",
              "back",
              "shoulders",
            ];

            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 65,
                  ),
                  InkWell(
                    onTap: () {},
                    splashColor: secondaryColor,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: media.size.height * 0.3,
                      width: double.infinity,
                      child: Text(
                        "Daily Exercise",
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                  ),
                  GridView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 25,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (ctx, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            "/sub-exercise",
                            arguments: {
                              "items": items,
                              "type": exerciseList[index],
                            },
                          );
                        },
                        borderRadius: BorderRadius.circular(15),
                        splashColor: Colors.grey,
                        highlightColor: secondaryColor.withOpacity(0.4),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: secondaryColor.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              exerciseList[index].toString().toUpperCase(),
                              style: const TextStyle(
                                color: textColor,
                              ),
                              maxLines: 1,
                              softWrap: false,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: 9,
                  ),
                ],
              ),
            );
          } else {
            Future.delayed(
              const Duration(
                seconds: 1,
              ),
              () => setState(
                () {
                  data;
                },
              ),
            );
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        future: fetchData(),
      ),
    );
  }
}

Future<List<ExerciseModel>> fetchData() async {
  var json = await rootBundle.loadString('assets/JSON/ExerciseDB.json');
  final list = jsonDecode(json) as List<dynamic>;

  return list.map((e) => ExerciseModel.fromJSON(e)).toList();
}
