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
import 'package:flutter/material.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args;
    if (settings.arguments != null) {
      args = settings.arguments as Map<String, dynamic>;
    }
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case '/welcome':
        return MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        );
      case '/login':
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
      case '/Temperature':
        return MaterialPageRoute(
          builder: (context) => const StepcountScreen(),
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
        throw const FormatException("Out of bound Routing");
    }
  }
}
