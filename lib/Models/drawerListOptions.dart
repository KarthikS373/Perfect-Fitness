import 'package:fitness_monitoring/Utils/Routes/routes.dart';

class DrawerListOptions {
  final String svgURL;
  final String title;
  final String onTap;

  const DrawerListOptions({
      required this.title,
      required this.onTap,
      this.svgURL = "assets/SVG/home.svg"
  });
}

List<DrawerListOptions> drawerListOptions = [
  const DrawerListOptions(title: "DashBoard", onTap: RouteManager.home),
  const DrawerListOptions(title: "ProfileScreen", onTap: RouteManager.profile),
  const DrawerListOptions(title: "Exercise", onTap: RouteManager.exercise),
  const DrawerListOptions(title: "Recent Activity", onTap: RouteManager.home),
  const DrawerListOptions(title: "Leaderboard", onTap: RouteManager.leaderboard),
  const DrawerListOptions(title: "Feedback", onTap: RouteManager.feedback),
];
