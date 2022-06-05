import 'package:fitness_monitoring/Screens/HomeScreen/HomeScreen.dart';
import 'package:fitness_monitoring/Screens/LoginSignup/loginScreen.dart';
import 'package:fitness_monitoring/Screens/LoginSignup/welcomeScreen.dart';
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
      case '/profile':
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case '/recent_activities':
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case '/pedometer':
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
      case '/StepCount':
        return MaterialPageRoute(
          builder: (context) => const StepcountScreen(),
        );
      default:
        throw const FormatException("Out of bound Routing");
    }
  }
}
