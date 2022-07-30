import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Screens/HeartRateScreen/heartRateScreen.dart';

class HealthProvider with ChangeNotifier {
  // Variables
  int steps =  0;
  final List<HeartRateData> chartData = [
    HeartRateData(1, 50.0 , Colors.red),
    HeartRateData(2, 80.0 , Colors.blue),
    HeartRateData(3, 60.0 , Colors.green),
  ];
  late SharedPreferences prefs;

  //Functions

  //* Steps
  //getter
  get getSteps {
    return steps;
  }

  get getter {
    return steps.toString();
  }

  set stepps(int stepsss) {
    steps = stepsss;
  }

  // set hrtrates(double val)
  // {
  //   d.add(val);
  // }

  void incrementSteps() async {
    steps++;
    notifyListeners();
  }

  void heartBeatListener(int bpm) {

      var x = HeartRateData(chartData.length, (bpm * 1.0), Colors.red);

    chartData.add(x);
    notifyListeners();
  }
}
