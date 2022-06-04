import 'package:flutter/material.dart';

class HomeGridOption{
  final IconData icons;
  final String name;

  HomeGridOption({required this.icons, required this.name});
}

List<HomeGridOption> homegridOptions = [
  HomeGridOption(icons: Icons.directions_run, name: "Step Count"),
  HomeGridOption(icons: Icons.heart_broken, name: "Heart Rate"),
  HomeGridOption(icons: Icons.local_fire_department, name: "Calories"),
  HomeGridOption(icons: Icons.thermostat_outlined, name: "Temperature"),
];