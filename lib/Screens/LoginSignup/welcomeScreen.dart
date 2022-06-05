import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0x33333333),
              Color(0xff382743),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 1.0],
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? Positioned(
                      bottom: 350,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/Images/Logo.png',
                            width: 130,
                          ),
                          const Text(
                            'Perfect Fitness',
                            style: TextStyle(
                              fontSize: 29,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Positioned(
                      top: MediaQuery.of(context).size.height * 0.15,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/Images/Logo.png',
                            width: 130,
                          ),
                          const Text(
                            'Perfect Fitness',
                            style: TextStyle(
                              fontSize: 29,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? Positioned(
                      bottom: 100,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/login');
                          },
                          child: Container(
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Get Started',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Positioned(
                      bottom: MediaQuery.of(context).size.height * 0.1,
                      left: 70,
                      right: 70,
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/login');
                          },
                          child: Container(
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Get Started',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
