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
            margin: EdgeInsets.fromLTRB(170, 40, 0, 0),
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.grey
              ),
              child: Icon(Icons.person, size: 80, color: Colors.white,),
            ),
          ),
          
        ],
      ),
    );
  }
}
