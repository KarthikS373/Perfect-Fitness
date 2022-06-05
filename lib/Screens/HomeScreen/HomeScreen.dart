import 'package:fitness_monitoring/Screens/HomeScreen/homeGrids.dart';
import 'package:fitness_monitoring/Screens/HomeScreen/homeHeader.dart';
import 'package:fitness_monitoring/Screens/HomeScreen/homeRecentActivities.dart';
import 'package:fitness_monitoring/Screens/HomeScreen/homeStepCount.dart';
import 'package:fitness_monitoring/Widgets/Drawer/drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              HomeHeader(),
              HomeStepCount(),
              HomeGrids(),
              HomeRecentActivities(),
            ],
          ),
        ),
      ),
    );
  }
}
