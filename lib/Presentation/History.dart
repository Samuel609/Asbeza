import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/grocery_bloc.dart';
import '../extra/appbar.dart';
import '../extra/drawer.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
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
                      label: const Text("Asbeza"),
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
            if (state.history.isEmpty) {
              return const Center(
                child: Text(
                  "No history\n Total: 0\$",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            } else {
              num TotalPrice = 0;

              void _counterinc() {
                for (var element in state.history) {
                  TotalPrice += element.Price;
                }
              }

              _counterinc();
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Text(
                      "Total: ${TotalPrice.toStringAsFixed(2)}\$",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    height: MediaQuery.of(context).size.height * .73,
                    child: ListView.builder(
                        itemCount: state.history.length,
                        itemBuilder: (BuildContext context, int index) {
                          final itemval = state.history[index];
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.contain,
                                                image: NetworkImage(
                                                    itemval.image))),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .2,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .3,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 5),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .25,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(itemval.title),
                                              Text(
                                                "${itemval.Price}\$",
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ]),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          );
                        }),
                  )
                ],
              );
            }
          }
          return Container();
        },
      ),
    );
  }
}
