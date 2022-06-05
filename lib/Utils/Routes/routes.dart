import 'package:fitness_monitoring/Screens/HomeScreen/HomeScreen.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args;
    if(settings.arguments != null){
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
      default:
        throw const FormatException("Out of bound Routing");
    }
  }
}
