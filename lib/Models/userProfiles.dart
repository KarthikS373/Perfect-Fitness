import '../Models/profileModel.dart';

const ROOT = "assets/Images/";
List<Profile> userProfiles = <Profile>[
  Profile(name: "Sparsh", age: 16, height: 152, weight: 58, email: "sprshtndn@gmail.com", image: "assets/Images/profilepic.jpg"),
];

Profile currentUser = userProfiles[0];