import 'package:flutter/material.dart';

class Profile {
  final String name, image;
  final double age, height, weight;

  Profile({
      required this.name,
      this.image = "assets/Images/defaultProfilePhoto.jpg",
      required this.age,
      required this.height,
      required this.weight
      });
}
