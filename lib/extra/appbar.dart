import 'package:flutter/material.dart';
import 'package:grocery101/routes.dart';

class appBar extends StatelessWidget {
  const appBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.amber,
      elevation: 10,
      foregroundColor: Colors.black,
      title: const Text("Asveza"),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.Profile);
          },
          icon: const Icon(Icons.account_circle),
        )
      ],
    );
  }
}
