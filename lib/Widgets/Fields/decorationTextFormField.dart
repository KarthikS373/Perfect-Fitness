import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

InputDecoration textDeco(String label) {
  return InputDecoration(
    filled: true,
    fillColor: secondaryColor,
    contentPadding: const EdgeInsets.all(12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.grey,
      ),
    ),
    focusColor: Colors.white,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.white,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.redAccent,
      ),
    ),
    label: Text(
      label,
    ),
    labelStyle: GoogleFonts.poppins(
      color: Colors.white24,
      letterSpacing: 1.5,
    ),
  );
}
