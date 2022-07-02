import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

void showSheet(
  BuildContext context, {
  required Widget child,
  required VoidCallback onClicked,
}) {
  showCupertinoModalPopup(
    barrierColor: Colors.black54,
    context: context,
    builder: (context) => CupertinoActionSheet(
      actions: [
        child,
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: onClicked,
        child: Text(
          'Done',
          style: GoogleFonts.nunito(
            color: textColor,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
      ),
    ),
  );
}
