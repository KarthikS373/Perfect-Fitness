import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: Icon(Icons.person_add)),
        ],
        title: Text(
          "Profile",style: TextStyle(fontSize: 29),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 40),
              height: 330,
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "data:image/png;base64,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"),
                        radius: 50,
                      ),
                      Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Icon(
                            Icons.edit,
                            color: Colors.purpleAccent,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    " Umm E Kulsum",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  SizedBox(
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
                                color: Colors.white.withOpacity(0.9)),
                          ),
                          Text("Level",
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      ),
                      Column(
                        children: [
                          Text("#335",
                              style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white.withOpacity(0.9))),
                          Text("Rank",
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Leaderboard",
              style: TextStyle(fontSize: 20),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: SizedBox(
                height: 300,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "data:image/png;base64,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"),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text("Umm E Kulsum")
                          ],
                        ),
                        leading: Text(
                          "#${index + 1}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                            "${(200000 / (index + 1)).toString().substring(0, 5)}",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                          thickness: 1,
                          color: Colors.purple,
                          indent: 10,
                          endIndent: 10,
                        ),
                    itemCount: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
