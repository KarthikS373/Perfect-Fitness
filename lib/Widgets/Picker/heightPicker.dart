import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class HeightPicker extends StatefulWidget {
  HeightPicker({
    Key? key,
    required this.getHeight,
  }) : super(key: key);

  Function getHeight;

  @override
  State<HeightPicker> createState() => _HeightPickerState();
}

class _HeightPickerState extends State<HeightPicker> {
  static const _base = 30;

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
        onSelectedItemChanged: (int value) {
          widget.getHeight(value + _base);
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
