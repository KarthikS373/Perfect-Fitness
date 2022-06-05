import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:fitness_monitoring/Widgets/Drawer/customDrawerList.dart';
import 'package:fitness_monitoring/Widgets/Drawer/drawerHeader.dart';
import 'package:fitness_monitoring/Widgets/Drawer/drawerPostCreds.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: bgColor,
          child: Column(
            children: const [
              CustomDrawerHeader(),
              CustomDrawerList(),
              Spacer(),
              DrawerPostCredits(),
            ],
          ),
        ),
      ),
    );
  }
}
