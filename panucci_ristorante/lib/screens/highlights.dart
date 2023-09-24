import 'package:flutter/material.dart';
import 'package:panucci_ristorante/components/highlight_item.dart';

import '../cardapio.dart';
import '../components/title.dart';

class Highlights extends StatelessWidget {
  const Highlights({super.key});
  final List items = destaques;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: CustomScrollView(
        slivers: <Widget>[
          const PageTitle(
            title: 'Destaques',
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
