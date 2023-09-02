import 'package:flutter/material.dart';

import '../components/box_card.dart';
import '../components/sections/header.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Header(),
          BoxCard(boxContent: Text('Olá mundo')),
        ],
      ),
    );
  }
}
