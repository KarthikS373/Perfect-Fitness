import 'package:flutter/material.dart';

class HomeGridOption {
  final String navURL;
  final IconData icons;
  final String name;

  HomeGridOption(
      {required this.navURL, required this.icons, required this.name});
}

List<HomeGridOption> homegridOptions = [
  HomeGridOption(
    icons: Icons.directions_run,
    name: "Step Count",
    navURL: "StepCount",
  ),
  HomeGridOption(
    icons: Icons.heart_broken,
    name: "Heart Rate",
    navURL: "HeartRate",
  ),
  HomeGridOption(
    icons: Icons.local_fire_department,
    name: "Calories",
    navURL: "Calories",
  ),
  HomeGridOption(
    icons: Icons.thermostat_outlined,
    name: "Temperature",
    navURL: "Temperature",
  ),
];
