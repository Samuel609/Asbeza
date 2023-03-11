import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery101/Presentation/History.dart';
import 'package:grocery101/Presentation/Profile.dart';
import 'package:grocery101/bloc/grocery_bloc.dart';
import 'package:grocery101/routes.dart';

import 'Presentation/MyHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GroceryBloc(),
      child: MaterialApp(
        initialRoute: Routes.MyHomePage,
        routes: {
          Routes.MyHomePage: (context) => const MyHomePage(),
          Routes.History: (context) => const History(),
          Routes.Profile: (context) => const ProfilePage()
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
