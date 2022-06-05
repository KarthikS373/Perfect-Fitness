import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerPostCredits extends StatelessWidget {
  const DrawerPostCredits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: secondaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Made with 🤍",
            style: GoogleFonts.aBeeZee(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
