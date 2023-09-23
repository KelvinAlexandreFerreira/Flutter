import 'package:flutter/material.dart';
import 'package:panucci_ristorante/cardapio.dart';
import 'package:panucci_ristorante/components/page_title.dart';

import '../components/food_item.dart';

class FoodMenu extends StatelessWidget {
  const FoodMenu({super.key});
  final List items = comidas;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: CustomScrollView(
        slivers: <Widget>[
          const PageTitle(
            title: 'Menu',
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return FoodItem(
                itemTitle: items[index]['name'],
                itemPrice: items[index]['price'],
                imageURI: items[index]['image'],
              );
            }, childCount: items.length),
          ),
        ],
      ),
    );
  }
}
