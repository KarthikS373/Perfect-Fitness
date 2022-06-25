import 'package:fitness_monitoring/Models/excersiseDB.dart';
import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubExerciseScreen extends StatelessWidget {
  const SubExerciseScreen(
      {Key? key, required this.exerciseType, required this.items})
      : super(key: key);

  final String exerciseType;
  final List<ExerciseModel> items;

  @override
  Widget build(BuildContext context) {
    final itemList = items
        .where((element) => element.bodyPart == exerciseType)
        .map((e) => e)
        .toList();
    itemList.map((e) => print(e.gifUrl.toString()));
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed("/exercise-info", arguments: {
                "item": itemList[index],
              });
            },
            splashColor: Colors.grey,
            child: ListTile(
              style: ListTileStyle.list,
              contentPadding: const EdgeInsets.all(20),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  itemList[index].gifUrl.toString(),
                ),
                radius: 30,
              ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemList[index].name.toString().toUpperCase(),
                    maxLines: 1,
                    style: GoogleFonts.nunito(
                      fontSize: 18,
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  Text(
                    "Equipments: ${itemList[index].equipment}",
                    style: GoogleFonts.poppins(
                      color: textColor,
                      fontSize: 12,
                      letterSpacing: 1.2,
                    ),
                    maxLines: 1,
                    softWrap: true,
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: itemList.length,
      ),
    );
  }
}
