import 'package:flutter/material.dart';
import 'package:circularbar/widget/iconColumn.dart';

class buttonNav extends StatelessWidget {
  const buttonNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: const Color(0xff224A88),
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          iconColumn(
              const Icon(
                Icons.home,
                color: Colors.green,
                size: 30,
              ),
              "Home"),
          iconColumn(
              const Icon(
                Icons.auto_graph_outlined,
                color: Colors.green,
                size: 30,
              ),
              "Report"),
          iconColumn(
              const Icon(
                Icons.health_and_safety,
                color: Colors.green,
                size: 30,
              ),
              "Health"),
          iconColumn(
              const Icon(
                Icons.settings,
                color: Colors.green,
                size: 30,
              ),
              "More")
        ],
      ),
    );
  }
}