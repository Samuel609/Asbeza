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
      backgroundColor: Colors.white,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 50),
                          alignment: Alignment.center,
                          elevation: 0),
                      onPressed: () {
                        BlocProvider.of<GroceryBloc>(context)
                            .add(const GroceryEvent());
                      },
                      icon: const Icon(Icons.shopping_basket_rounded),
                      label: const Text("the best asbeza"),
                    ),
                  ],
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
              height: MediaQuery.of(context).size.height * 0.88,
              child: ListView.builder(
                itemCount: state.itemss.length,
                itemBuilder: (BuildContext context, int index) {
                  final itemval = state.itemss[index];
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Card(
                                elevation: 20,
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: NetworkImage(itemval.image))),
                                  height:
                                      MediaQuery.of(context).size.height * .1,
                                  width: MediaQuery.of(context).size.width * .3,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 11, vertical: 5),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(itemval.foodTile),
                                    Text(
                                      "${itemval.foodPrice}\$",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w900),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.shopping_cart))
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      )
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
