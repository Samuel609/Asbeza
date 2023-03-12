import 'package:flutter/material.dart';
import 'package:grocery101/extra/drawer.dart';

import '../extra/appbar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: appBar()),
      drawer: drawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(130, 54, 0, 0),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.amber,
                image: const DecorationImage(
                    fit: BoxFit.contain, image: AssetImage('assets/jj.jpg'))),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(34, 40, 0, 0),
            width: 300,
            height: 100,
            child: const Text("Name:  Samuel Abera"),
          )
        ],
      ),
    );
  }
}
