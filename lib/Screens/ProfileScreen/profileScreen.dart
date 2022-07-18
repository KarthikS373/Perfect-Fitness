import 'package:fitness_monitoring/Models/userProfiles.dart';
import 'package:fitness_monitoring/Services/firebase_auth_methods.dart';
import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:fitness_monitoring/Widgets/Buttons/containerButton.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _radii = 50.0;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
            widthFactor: 1,
            alignment: Alignment.topCenter,
            heightFactor: 0.7,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(currentUser.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.3,
            child: Container(
              color: Colors.white54,
            ),
          ),
          SlidingUpPanel(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(_radii),
              topRight: Radius.circular(_radii),
            ),
            minHeight: MediaQuery.of(context).size.height * 0.35,
            maxHeight: MediaQuery.of(context).size.height * 0.85,
            panel: Container(
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_radii),
                  topRight: Radius.circular(_radii),
                ),
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.85,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 45,
                      ),
                      child: Column(
                        children: [
                          Text(
                            currentUser.name,
                            style: GoogleFonts.aBeeZee(
                              fontSize: 28,
                              color: textColor,
                            ),
                          ),
                          Text(
                            currentUser.email,
                            style: GoogleFonts.aBeeZee(
                              fontSize: 14,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.withOpacity(0.6),
                            indent: 100,
                            endIndent: 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 35,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Height",
                                        style: GoogleFonts.nunito(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: textColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "${currentUser.height} cm",
                                        style: GoogleFonts.aBeeZee(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Age",
                                        style: GoogleFonts.nunito(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: textColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "${currentUser.age}",
                                        style: GoogleFonts.aBeeZee(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Weight",
                                        style: GoogleFonts.nunito(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: textColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "${currentUser.weight} kg",
                                        style: GoogleFonts.aBeeZee(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.95,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Stack(
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: PieChart(
                                        PieChartData(
                                          startDegreeOffset: 120,
                                          sections: [
                                            PieChartSectionData(
                                              color: greenTextColor,
                                              value: 20,
                                              showTitle: false,
                                              radius: 5,
                                            ),
                                            PieChartSectionData(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              value: 40,
                                              showTitle: false,
                                              radius: 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      top: 30,
                                      left: 32,
                                      child: Icon(
                                        Icons.directions_run,
                                        size: 40,
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: PieChart(
                                        PieChartData(
                                          startDegreeOffset: 120,
                                          sections: [
                                            PieChartSectionData(
                                              color: greenTextColor,
                                              value: 80,
                                              showTitle: false,
                                              radius: 5,
                                            ),
                                            PieChartSectionData(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              value: 40,
                                              showTitle: false,
                                              radius: 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      top: 30,
                                      left: 32,
                                      child: Icon(
                                        Icons.local_fire_department_outlined,
                                        size: 40,
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: PieChart(
                                        PieChartData(
                                          startDegreeOffset: 120,
                                          sections: [
                                            PieChartSectionData(
                                              color: greenTextColor,
                                              value: 40,
                                              showTitle: false,
                                              radius: 5,
                                            ),
                                            PieChartSectionData(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              value: 40,
                                              showTitle: false,
                                              radius: 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      top: 30,
                                      left: 32,
                                      child: Icon(
                                        Icons.heart_broken,
                                        size: 40,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 120,
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                Card(
                                  color: secondaryColor,
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Edit Info",
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          color: textColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Card(
                                  color: secondaryColor,
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Recent Activities",
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          color: textColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                            ),
                            onPressed: () {
                              context.read< FirebaseAuthServices>().signOut(context);
                            },
                            child: Text(
                              "logout",
                              style: GoogleFonts.aBeeZee(
                                fontSize: 18,
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: Container(
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
