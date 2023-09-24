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
          MediaQuery.of(context).orientation == Orientation.landscape
              ? _landscapeList(items: items)
              : _portraitList(items: items)
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class _portraitList extends StatelessWidget {
  const _portraitList({
    super.key,
    required this.items,
  });

  final List items;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return HighlightItem(
          imageURI: items[index]['image'],
          itemTitle: items[index]['name'],
          itemPrice: items[index]['price'],
          itemDescription: items[index]['description'],
        );
      }, childCount: items.length),
    );
  }
}

// ignore: camel_case_types
class _landscapeList extends StatelessWidget {
  const _landscapeList({
    super.key,
    required this.items,
  });

  final List items;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return HighlightItem(
            imageURI: items[index]['image'],
            itemTitle: items[index]['name'],
            itemPrice: items[index]['price'],
            itemDescription: items[index]['description'],
          );
        },
        childCount: items.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.9,
      ),
    );
  }
}
