import 'package:fitness_monitoring/Utils/Routes/routes.dart';
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
    navURL: RouteManager.stepCount,
  ),
  HomeGridOption(
    icons: Icons.heart_broken,
    name: "Heart Rate",
    navURL: RouteManager.heartBeat,
  ),
  HomeGridOption(
    icons: Icons.local_fire_department,
    name: "Calories",
    navURL: RouteManager.calories,
  ),
  HomeGridOption(
    icons: Icons.water_drop,
    name: "Sleep & Water",
    navURL: RouteManager.waterSleep,
  ),
];
