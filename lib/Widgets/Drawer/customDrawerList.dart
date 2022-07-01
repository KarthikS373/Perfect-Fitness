import 'package:fitness_monitoring/Models/drawerListOptions.dart';
import 'package:fitness_monitoring/Widgets/Drawer/drawerListTile.dart';
import 'package:flutter/material.dart';

class CustomDrawerList extends StatelessWidget {
  const CustomDrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return DrawerListTile(
            width: double.infinity,
            title: drawerListOptions[index].title,
            onTap: () {
              Scaffold.of(context).closeDrawer();
              Navigator.of(context).pushNamed(drawerListOptions[index].onTap);
            },
            svgURL: drawerListOptions[index].svgURL,
          );
        },
        itemCount: drawerListOptions.length,
      ),
    );
  }
}
