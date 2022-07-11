import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class WeightPicker extends StatefulWidget {
  WeightPicker({
    Key? key,
    required this.getWeight,
  }) : super(key: key);

  Function getWeight;

  @override
  State<WeightPicker> createState() => _WeightPickerState();
}

class _WeightPickerState extends State<WeightPicker> {
  static const num _base = 30;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: CupertinoPicker(
        diameterRatio: 0.80,
        selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
          background: secondaryColor.withOpacity(0.2),
        ),
        itemExtent: 48,
        magnification: 1.1,
        onSelectedItemChanged: (num value) {
          widget.getWeight(value + _base);
        },
        children: List<Widget>.generate(
          200,
              (index) {
            return Text(
              "${index + _base}",
              style: GoogleFonts.nunito(
                color: textColor,
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            );
          },
        ),
      ),
    );
  }
}
