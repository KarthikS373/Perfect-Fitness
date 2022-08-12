import 'package:fitness_monitoring/Utils/Routes/routes.dart';
import 'package:fitness_monitoring/Widgets/Cards/materialCard.dart';
import 'package:fitness_monitoring/Widgets/Picker/dobPicker.dart';
import 'package:fitness_monitoring/Widgets/Picker/heightPicker.dart';
import 'package:fitness_monitoring/Widgets/Picker/weightPicker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../Utils/Theme/colors.dart';
import '../../Widgets/Modals/sheetModal.dart';

class DetailCollectionScreen extends StatefulWidget {
  const DetailCollectionScreen({Key? key}) : super(key: key);

  @override
  State<DetailCollectionScreen> createState() => _DetailCollectionScreenState();
}

class _DetailCollectionScreenState extends State<DetailCollectionScreen> {
  num _weight = 0, _height = 0;
  DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              width: double.infinity,
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (ctx) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                        ),
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.symmetric(
                                  horizontal: 1,
                                  vertical: 25,
                                ),
                              ),
                            ),
                            child: Text(
                              "Camera",
                              style: GoogleFonts.nunito(
                                color: textColor,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                          ),
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.symmetric(
                                  horizontal: 1,
                                  vertical: 25,
                                ),
                              ),
                            ),
                            child: Text(
                              "Gallery",
                              style: GoogleFonts.nunito(
                                color: textColor,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey.withOpacity(0.2),
                child: const Icon(
                  Icons.add_photo_alternate,
                  color: Colors.grey,
                  size: 32,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Name",
              style: GoogleFonts.nunito(
                color: Colors.grey,
                letterSpacing: 1.2,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "example@example.com",
              style: GoogleFonts.nunito(
                color: Colors.grey.withOpacity(0.5),
                letterSpacing: 1.2,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 3,
                    child: InkWell(
                      splashColor: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      focusColor: Colors.transparent,
                      onTap: () {
                        showSheet(
                          context,
                          child: HeightPicker(
                            getHeight: (height) {
                              setState(
                                    () {
                                  _height = height;
                                },
                              );
                            },
                          ),
                          onClicked: () {
                            Navigator.of(context).pop();
                          },
                        );
                      },
                      child: MaterialSecCard(
                        borderRadius: 12.0,
                        child: Text(
                          "$_height cm",
                          style: GoogleFonts.nunito(
                            color: fadedTextColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 3,
                    child: InkWell(
                      splashColor: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        showSheet(
                          context,
                          child: WeightPicker(
                            getWeight: (weight) {
                              setState(
                                    () {
                                  _weight = weight;
                                },
                              );
                            },
                          ),
                          onClicked: () {
                            Navigator.of(context).pop();
                          },
                        );
                      },
                      child: MaterialSecCard(
                        borderRadius: 12.0,
                        child: Text(
                          "$_weight Kg",
                          style: GoogleFonts.nunito(
                            color: fadedTextColor,
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
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
              ),
              child: MaterialSecCard(
                borderRadius: 12.0,
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat("dd-MMMM-yyyy").format(_date),
                      style: GoogleFonts.nunito(
                        letterSpacing: 1.7,
                        wordSpacing: 1.5,
                        color: fadedTextColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showSheet(
                          context,
                          child: DatePicker(
                            getDate: (date) {
                              setState(
                                    () {
                                  _date = date;
                                },
                              );
                            },
                          ),
                          onClicked: () {
                            Navigator.of(context).pop();
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.calendar_month_outlined,
                        color: fadedTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  primary: secondaryColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 18,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    RouteManager.home,
                  );
                },
                child: Text(
                  "Continue",
                  style: GoogleFonts.poppins(
                    color: textColor,
                    fontSize: 16,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}