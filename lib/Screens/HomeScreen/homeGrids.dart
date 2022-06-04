import 'package:fitness_monitoring/Models/homeGridOptions.dart';
import 'package:fitness_monitoring/Utils/colors.dart';
import 'package:flutter/material.dart';

class HomeGrids extends StatelessWidget {
  const HomeGrids({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.5,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
        itemCount: homegridOptions.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: const BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            height: 50,
            width: 50,
            child: Text(homegridOptions[index].name),
          );
        },
      ),
    );
  }
}
