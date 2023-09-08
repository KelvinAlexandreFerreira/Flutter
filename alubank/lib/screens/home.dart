import 'package:alubank/themes/theme_colors.dart';
import 'package:flutter/material.dart';

import '../components/box_card.dart';
import '../components/color_dot.dart';
import '../components/sections/header.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Header(),
          BoxCard(
              boxContent: ColorDot(color: ThemeColors.recentActivity['spent'])),
        ],
      ),
    );
  }
}
