import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FitnessCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<IconData> icons;

  const FitnessCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/exercise');
      },
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 25,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              secondaryColor.withOpacity(0.5),
              secondaryColor.withOpacity(0.7),
              secondaryColor.withOpacity(0.9),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subtitle,
                style: GoogleFonts.actor(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                title,
                style: GoogleFonts.aBeeZee(
                  letterSpacing: 2,
                  color: textColor,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: glassColor,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        icons[0],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: glassColor,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        icons[1],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: glassColor,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        icons[2],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: glassColor,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        icons[3],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
