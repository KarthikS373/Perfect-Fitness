import 'package:fitness_monitoring/Widgets/Cards/materialCard.dart';
import 'package:fitness_monitoring/Widgets/Picker/heightPicker.dart';
import 'package:fitness_monitoring/Widgets/Picker/weightPicker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/Theme/colors.dart';
import '../../Widgets/Modals/sheetModal.dart';

class DetailCollectionScreen extends StatefulWidget {
  const DetailCollectionScreen({Key? key}) : super(key: key);

  @override
  State<DetailCollectionScreen> createState() => _DetailCollectionScreenState();
}

class _DetailCollectionScreenState extends State<DetailCollectionScreen> {
  double _weight = 0, _age = 0, _height = 0;

  @override
  Widget build(BuildContext context) {
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
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey.withOpacity(0.2),
              child: const Icon(
                Icons.add_photo_alternate,
                color: Colors.grey,
                size: 32,
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
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
                    borderRadius: 12,
                    child: Text(
                      "$_height cm",
                      style: GoogleFonts.nunito(
                        color: textColor,
                      ),
                    ),
                  ),
                ),
                InkWell(
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
                    borderRadius: 12,
                    child: Text(
                      "$_weight Kg",
                      style: GoogleFonts.nunito(
                        color: textColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
