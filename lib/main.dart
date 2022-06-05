import 'package:flutter/material.dart';
import 'package:circularbar/dashboard.dart';

import 'package:circularbar/footCounter.dart';

void main() => runApp(
  const MaterialApp(
    home: dashboard(),
    debugShowCheckedModeBanner: false,
    title: "Foot step Counter",
  ),
);