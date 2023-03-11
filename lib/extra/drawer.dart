import 'package:flutter/material.dart';

import '../routes.dart';

class drawer extends StatelessWidget {
  drawer({super.key});
  final drawerItems = [
    {"title": "MyHomePage", "route": Routes.MyHomePage, "icon": Icons.home},
    {"title": "History", "route": Routes.History, "icon": Icons.shopping_bag},
    {"title": "Profile", "route": Routes.Profile, "icon": Icons.account_circle}
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: Container(
        margin: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: drawerItems.length,
          itemBuilder: (BuildContext context, int index) {
            final item = drawerItems[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size(100, 50),
                      alignment: Alignment.centerLeft,
                      elevation: 0),
                  onPressed: () {
                    Navigator.pushNamed(context, item["route"].toString());
                  },
                  icon: Icon(item["icon"] as IconData?),
                  label: Text(item["title"].toString())),
            );
          },
        ),
      )),
    );
  }
}
