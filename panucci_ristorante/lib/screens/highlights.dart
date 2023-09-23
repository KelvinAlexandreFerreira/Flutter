import 'package:flutter/material.dart';
import 'package:panucci_ristorante/components/highlight_item.dart';

import '../cardapio.dart';

class Highlights extends StatelessWidget {
  const Highlights({super.key});
  final List items = destaques;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                "Destaques",
                style: TextStyle(fontFamily: "Caveat", fontSize: 32),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return HighlightItem(
                imageURI: items[index]['image'],
                itemTitle: items[index]['name'],
                itemPrice: items[index]['price'],
                itemDescription: items[index]['description'],
              );
            }, childCount: items.length),
          ),
        ],
      ),
    );
  }
}
