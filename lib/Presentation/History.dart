import 'package:flutter/material.dart';
import 'package:grocery101/model/item.dart';

import '../model/item_tile.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final List<Item> _items = [Item(name: 'Sam', price: 1000, img: 'img')];

  @override
  State<History> createState() => _HistoryState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return ItemTile(
              name: _items[index].name,
              amount: _items[index].price,
            );
          }),
    );
  }
}
