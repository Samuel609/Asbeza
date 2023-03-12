import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery101/bloc/grocery_bloc.dart';
import 'package:grocery101/extra/drawer.dart';

import '../extra/appbar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: appBar(),
      ),
      drawer: drawer(),
      body: BlocBuilder<GroceryBloc, GroceryState>(
        builder: (context, state) {
          if (state is GroceryInitial) {
            return Column(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(100, 100, 80, 0),
                    child: Image.asset(
                      'assets/rr.jpg',
                      width: 1000,
                      fit: BoxFit.fitWidth,
                      colorBlendMode: BlendMode.darken,
                    )),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Offering the best for the best!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<GroceryBloc>(context)
                        .add(const GroceryFetchEvent());
                  },
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      padding: const EdgeInsets.all(24.0)),
                  child: const Text("Start"),
                ),
              ],
            );
          }
          if (state is GroceryLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GrocerySuccess) {
            return Container(
              margin: const EdgeInsets.only(top: 5),
              height: MediaQuery.of(context).size.height * 0.90,
              child: ListView.builder(
                itemCount: state.itemss.length,
                itemBuilder: (BuildContext context, int index) {
                  final itemval = state.itemss[index];
                  return Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Card(
                                elevation: 100,
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: NetworkImage(itemval.image))),
                                  height:
                                      MediaQuery.of(context).size.height * .3,
                                  width: MediaQuery.of(context).size.width * .9,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .35,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          itemval.title,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "${itemval.Price}\$",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w900),
                                        )
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        BlocProvider.of<GroceryBloc>(context)
                                            .add(HistoryEvent(itemss: itemval));
                                      },
                                      icon: const Icon(
                                        Icons.shopping_cart_checkout_rounded,
                                        color: Colors.white,
                                        size: 40,
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
