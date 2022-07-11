import 'package:fitness_monitoring/Screens/WaterSleepScreen/SleepScreen/SleepScreen.dart';
import 'package:fitness_monitoring/Screens/WaterSleepScreen/WaterScreen/waterScreen.dart';
import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:flutter/material.dart';

class WaterSleepScreen extends StatefulWidget {
  const WaterSleepScreen({Key? key}) : super(key: key);

  @override
  State<WaterSleepScreen> createState() => _WaterSleepScreenState();
}

class _WaterSleepScreenState extends State<WaterSleepScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      animationDuration: const Duration(
        milliseconds: 500,
      ),
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 0,
          backgroundColor: secondaryColor,
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicatorWeight: 1,
            indicatorColor: waterColor,
            tabs: [
              Tab(
                icon: Icon(Icons.water_drop),
                text: "Water",
              ),
              Tab(
                icon: Icon(Icons.bed_sharp),
                text: "Sleep",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            WaterScreen(),
            SleepScreen(),
          ],
        ),
      ),
    );
  }
}
