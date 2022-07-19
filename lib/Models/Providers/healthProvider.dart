import 'package:flutter/foundation.dart';

class HealthProvider with ChangeNotifier{
  // Variables
  int _steps = 0;
  var d = [0.0, 1.0, 2.0, -1.5];

  //Functions

  //* Steps
  //getter
  get getSteps{
    return _steps;
  }

  void incrementSteps() {
    _steps++;
    notifyListeners();
  }

  void heartBeatListener(var bpm , d)
  {
    d.add((bpm - 70).toDouble());
    notifyListeners();
  }


}