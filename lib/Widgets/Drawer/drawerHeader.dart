import 'package:fitness_monitoring/Models/userProfiles.dart';
import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: secondaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
              currentUser.image,
            ),
            maxRadius: 30,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            currentUser.name,
            style: GoogleFonts.poppins(
              fontSize: 17,
              fontWeight: FontWeight.w300,
              letterSpacing: 1.2,
            ),
          ),
          Text(
            currentUser.email,
            style: TextStyle(color: Colors.grey.withOpacity(0.9)),
          ),
        ],
      ),
    );
  }
}
