import 'dart:math';

import 'package:fitness_monitoring/Models/userProfiles.dart';
import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:flutter/material.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
            ),
          ),
        ],
        title: const Text(
          "LeaderBoard",
          style: TextStyle(
            fontSize: 29,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 40),
              height: max(330, media.size.height * 0.5),
              decoration: const BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(currentUser.image),
                        radius: 50,
                      ),
                      Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white54,
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.black45,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    currentUser.name,
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "45",
                            style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w300,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                          const Text(
                            "Level",
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "#335",
                            style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w300,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                          const Text(
                            "Rank",
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Ranks",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: SizedBox(
                height: 300,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Row(
                        children: const [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                                "assets/Images/defaultProfilePhoto.jpg"),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text("Umm E Kulsum")
                        ],
                      ),
                      leading: Text(
                        "#${index + 1}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                          (200000 / (index + 1)).toString().substring(0, 5),
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                    thickness: 1,
                    color: secondaryColor,
                    indent: 10,
                    endIndent: 10,
                  ),
                  itemCount: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
