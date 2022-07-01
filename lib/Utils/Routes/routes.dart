import 'package:fitness_monitoring/Screens/ActivityScreen/activityScreen.dart';
import 'package:fitness_monitoring/Screens/ExerciseScreen/exerciseInfo.dart';
import 'package:fitness_monitoring/Screens/ExerciseScreen/exerciseScreen.dart';
import 'package:fitness_monitoring/Screens/ExerciseScreen/subExerciseScreen.dart';
import 'package:fitness_monitoring/Screens/FeedbackScreen/feedbackScreen.dart';
import 'package:fitness_monitoring/Screens/HomeScreen/HomeScreen.dart';
import 'package:fitness_monitoring/Screens/LeaderBoardScreen/leaderboardScreen.dart';
import 'package:fitness_monitoring/Screens/LoginSignup/loginScreen.dart';
import 'package:fitness_monitoring/Screens/LoginSignup/welcomeScreen.dart';
import 'package:fitness_monitoring/Screens/ProfileScreen/profileScreen.dart';
import 'package:fitness_monitoring/Screens/StepcountScreen/stepScreen.dart';
import 'package:fitness_monitoring/Screens/WaterSleepScreen/water_sleepScreen.dart';
import 'package:flutter/material.dart';

class RouteManager {

  static const String home = '/';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String profile = '/profile';
  static const String stepCount = '/StepCount';
  static const String heartBeat = '/HeartRate';
  static const String calories = '/Calories';
  static const String waterSleep = '/water-sleep';
  static const String exercise = '/exercise';
  static const String subExercise = '/sub-exercise';
  static const String exerciseInfo = '/exercise-info';
  static const String activities= '/activities';
  static const String leaderboard = '/leaderboard';
  static const String feedback = '/feedback';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args;
    if (settings.arguments != null) {
      args = settings.arguments as Map<String, dynamic>;
    }
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case welcome:
        return MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        );
      case login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case '/profile':
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );
      case '/StepCount':
        return MaterialPageRoute(
          builder: (context) => const StepcountScreen(),
        );
      case '/HeartRate':
        return MaterialPageRoute(
          builder: (context) => const StepcountScreen(),
        );
      case '/Calories':
        return MaterialPageRoute(
          builder: (context) => const StepcountScreen(),
        );
      case waterSleep:
        return MaterialPageRoute(
          builder: (context) => const WaterSleepScreen(),
        );

      case '/exercise':
        return MaterialPageRoute(
          builder: (context) => const ExerciseScreen(),
        );

      case '/sub-exercise':
        return MaterialPageRoute(
          builder: (context) => SubExerciseScreen(
            exerciseType: args["type"],
            items: args["items"],
          ),
        );

       case '/exercise-info':
        return MaterialPageRoute(
          builder: (context) => ExerciseInfo(
            item: args["item"],
          ),
        );

      case '/activities':
        return MaterialPageRoute(
          builder: (context) => const ActivityScreen(),
        );

      case '/leaderboard':
        return MaterialPageRoute(
          builder: (context) => const LeaderboardScreen(),
        );

      case '/feedback':
        return MaterialPageRoute(
          builder: (context) => const FeedbackScreen(),
        );

      default:
        throw FormatException("Out of bound Routing at path ${settings.name}");
    }
  }
}
