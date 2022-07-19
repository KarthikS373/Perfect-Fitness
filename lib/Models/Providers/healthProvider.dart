import 'package:flutter/foundation.dart';

class HealthProvider with ChangeNotifier{
  // Variables
  int _steps = 0;

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


}