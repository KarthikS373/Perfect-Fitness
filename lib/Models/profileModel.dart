class Profile {
  final String name, image;
  final double age, height, weight;
  final String email;

  Profile({
      required this.email,
      required this.name,
      this.image = "assets/Images/defaultProfilePhoto.jpg",
      required this.age,
      required this.height,
      required this.weight
  });
}
