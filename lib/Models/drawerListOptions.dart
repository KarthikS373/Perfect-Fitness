import 'package:flutter/material.dart';

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
  const DrawerListOptions(title: "DashBoard", onTap: ""),
  const DrawerListOptions(title: "ProfileScreen", onTap: ""),
  const DrawerListOptions(title: "Exercise", onTap: "/exercise"),
  const DrawerListOptions(title: "Recent Activity", onTap: ""),
  const DrawerListOptions(title: "Leaderboard", onTap: "/leaderboard"),
  const DrawerListOptions(title: "Feedback", onTap: "/feedback"),
];
