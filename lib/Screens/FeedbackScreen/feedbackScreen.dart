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
                  child: Image.asset("assets/images/img.png"),
                )),
            SafeArea(
                child: Container(
              padding: EdgeInsets.all(kDefaultPadding + 2),
              child: Column(
                children: [
                  CustomAppBar(),
                  SizedBox(height: kDefaultPadding + 2),
                  Image.asset(
                    "assets/images/dp.png",
                    width: getScreenProportionWidth(166, MediaQuery.of(context).size),
                  ),
                  SizedBox(height: kDefaultPadding + 2),
                  const Text(
                    "Username ",
                    style: TextStyle(
                      color: kTextLightColor,
                      fontSize: 14,
                    ),
                  ),
                  const Text(
                    'Spartan',
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding + 2),
                  const Divider(
                    color: kTextLightColor,
                  ),
                  const SizedBox(height: kDefaultPadding + 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      RideInfo(title: 'Time', value: '1000 min'),
                      RideInfo(title: 'Calories', value: '10000'),
                      RideInfo(title: 'Distance', value: '150 km'),
                    ],
                  ),
                  const SizedBox(height: kDefaultPadding + 2),
                  const Divider(
                    color: kTextLightColor,
                  ),
                  const Text(
                    "How is your experience of our app ",
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding + 2),
                  SmoothStarRating(
                    size: 45,
                    onRated: (v) {},
                    starCount: 5,
                    allowHalfRating: true,
                    spacing: kDefaultPadding,
                  ),
                  const SizedBox(height: kDefaultPadding + 2),
                  Container(
                      padding: EdgeInsets.all(kDefaultPadding),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 15,
                              offset: const Offset(0.0, 15.0),
                              color: kTextColor.withAlpha(20),
                            )
                          ]),
                      child: const TextField(
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        maxLines: 2,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Additional Comments',
                          hintStyle: TextStyle(
                            color: kTextLightColor,
                          ),
                        ),
                      )),
                  const SizedBox(height: kDefaultPadding + 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward),
                        label: const Text(
                          '',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

class AppHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        width: double.infinity,
        height: 350.0,
        color: kPrimaryColor,
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
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            color: Colors.white,
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
            color: kPrimaryColor,
          ),
        ),
        SizedBox(width: kDefaultPadding),
        Text(
          'You are all fit!',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
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
      text: TextSpan(children: [
        TextSpan(
          text: title + '\n',
          style: TextStyle(
            color: kTextLightColor,
            fontSize: 14,
          ),
        ),
        TextSpan(
            text: value,
            style: TextStyle(
              color: kTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            )),
      ]),
    );
  }
}
