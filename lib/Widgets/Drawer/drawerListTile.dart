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
      required this.svgURL})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
