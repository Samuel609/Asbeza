import 'package:flutter/material.dart';
import 'package:grocery101/Presentation/History.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("home page"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 300, 0),
            child: const Text(
              "asbeza",
              style: TextStyle(
                fontSize: 24,
                color: Colors.amber,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const History(),
                ));
            },
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              child: const Text("Go to second page"),            
             )
        ],
      )),
    );
  }
}
