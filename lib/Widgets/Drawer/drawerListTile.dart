import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerListTile extends StatelessWidget {
  final double width;
  final String svgURL;
  final String title;
  final VoidCallback onTap;

  const DrawerListTile(
      {Key? key,
      required this.width,
      required this.title,
      required this.onTap,
      this.svgURL = "assets/SVG/home.svg"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 25,
      ),
      onTap: onTap,
      horizontalTitleGap: 0,
      leading: SvgPicture.asset(
        svgURL,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white54,
        ),
      ),
    );
  }
}
