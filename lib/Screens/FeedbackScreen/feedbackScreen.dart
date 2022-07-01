import 'package:fitness_monitoring/Models/userProfiles.dart';
import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

const kPrimaryColor = Color(0XFF2DBB54);
const kTextColor = Color(0XFF303030);
const kTextLightColor = Color(0XFFD9D9D9);
const kIndicatorColor = Color(0XFFCBCCD5);
const kBackgroundColor = Color(0XFFF6F8FF);
const kDividerColor = Color(0XFFF6F6F6);

const kDefaultPadding = 18.0;

double getScreenProportionHeight(double actualHeight, Size size) {
  return (actualHeight / 896.0) * size.height;
}

double getScreenProportionWidth(double actualWidth, Size size) {
  return (actualWidth / 414.0) * size.width;
}

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            AppHeader(),
            Positioned(
              top: -600,
              left: -187,
              child: Opacity(
                opacity: 0.9,
                child: Image.asset("assets/Images/Logo.png"),
              ),
            ),
            SafeArea(
              child: Container(
                padding: const EdgeInsets.all(kDefaultPadding + 2),
                child: Column(
                  children: [
                    CustomAppBar(),
                    const SizedBox(height: kDefaultPadding + 2),
                    Image.asset(
                      "assets/Images/Logo.png",
                      width: getScreenProportionWidth(
                          166, MediaQuery.of(context).size),
                    ),
                    const SizedBox(
                      height: kDefaultPadding + 2,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Username ",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      currentUser.name,
                      style: const TextStyle(
                        color: textColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: kDefaultPadding + 2,
                    ),
                    const Divider(
                      indent: 35,
                      endIndent: 35,
                      color: kTextLightColor,
                    ),
                    const SizedBox(
                      height: kDefaultPadding + 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        RideInfo(
                          title: 'Time',
                          value: '1000 min',
                        ),
                        RideInfo(
                          title: 'Calories',
                          value: '10000',
                        ),
                        RideInfo(
                          title: 'Distance',
                          value: '150 km',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: kDefaultPadding + 2,
                    ),
                    const Divider(
                      indent: 35,
                      endIndent: 35,
                      color: kTextLightColor,
                    ),
                    const Text(
                      "How is your experience of our app ",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: kDefaultPadding + 2,
                    ),
                    SmoothStarRating(
                      color: Colors.yellowAccent,
                      borderColor: Colors.white,
                      size: 45,
                      onRated: (v) {},
                      starCount: 5,
                      allowHalfRating: true,
                      spacing: kDefaultPadding,
                    ),
                    const SizedBox(
                      height: kDefaultPadding + 2,
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 15,
                              offset: const Offset(0.0, 15.0),
                              color: kTextColor.withAlpha(20),
                            )
                          ]),
                      child: const TextField(
                        cursorColor: textColor,
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Additional Comments',
                          hintStyle: TextStyle(
                            color: Colors.white54,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: kDefaultPadding + 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: greenTextColor,
                          ),
                          label: const Text(
                            "",
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: secondaryColor,
                            elevation: 4,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: bgColor,
    );
  }
}

class AppHeader extends StatelessWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        width: double.infinity,
        height: 350.0,
        color: secondaryColor,
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 160);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 170);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50.0,
          height: 50.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            color: Colors.white,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: greenTextColor,
          ),
        ),
        const SizedBox(width: kDefaultPadding),
        const Text(
          'You are all fit!',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        )
      ],
    );
  }
}

class RideInfo extends StatelessWidget {
  const RideInfo({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$title\n',
            style: const TextStyle(
              color: textColor,
              fontSize: 14,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
