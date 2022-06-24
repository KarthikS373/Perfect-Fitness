import 'package:flutter/material.dart';

class DrawerListOptions {
  final String svgURL;
  final String title;
  final VoidCallback onTap;

  const DrawerListOptions({
      required this.title,
      required this.onTap,
      this.svgURL = "assets/SVG/home.svg"
  });
}

List<DrawerListOptions> drawerListOptions = [
  DrawerListOptions(title: "DashBoard", onTap: (){}),
  DrawerListOptions(title: "ProfileScreen", onTap: (){}),
  DrawerListOptions(title: "Recent Activity", onTap: (){}),
  DrawerListOptions(title: "Leaderboard", onTap: (){}),
  DrawerListOptions(title: "Developers", onTap: (){}),
];
