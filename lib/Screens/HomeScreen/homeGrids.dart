import 'package:fitness_monitoring/Models/homeGridOptions.dart';
import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HomeGrids extends StatelessWidget {
  const HomeGrids({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.height * 0.5
          : 720,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemCount: homegridOptions.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTapDown: (details) {
              Navigator.of(context).pushNamed(homegridOptions[index].navURL);
            },
            child: Container(
              decoration: const BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              height: 50,
              width: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(homegridOptions[index].icons, size: 50),
                  Text(homegridOptions[index].name),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
