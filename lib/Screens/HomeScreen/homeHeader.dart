import 'package:fitness_monitoring/Models/userProfiles.dart';
import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:fitness_monitoring/Widgets/Fields/searchField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTapDown: (details) {
            Scaffold.of(context).openDrawer();
          },
          child: Text(
            "Home",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        const Expanded(
          flex: 2,
          child: SearchField(),
        ),
        GestureDetector(
          onTapDown: (details) {
            Navigator.of(context).pushNamed('/profile');
          },
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: CircleAvatar(
                  radius: 15.0,
                  backgroundImage: AssetImage(
                    currentUser.image,
                  ),
                ),
              ),
              Text(
                currentUser.name,
                style: GoogleFonts.poppins(
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
