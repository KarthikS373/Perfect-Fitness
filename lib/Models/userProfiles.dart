import '../Models/profileModel.dart';

const ROOT = "assets/Images/";
List<Profile> userProfiles = <Profile>[
  Profile(
      name: "Alice",
      age: 16,
      height: 152,
      weight: 58,
      email: "Alice123@gmail.com",
      image: "assets/Images/User1.jpg"),
];

Profile currentUser = userProfiles[0];
