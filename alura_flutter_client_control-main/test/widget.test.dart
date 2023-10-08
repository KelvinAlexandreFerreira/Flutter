import 'package:client_control/components/hamburger_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Hamburguer Menu should have "Menu"', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: HamburgerMenu(),
    ));
    expect(find.text('Menu'), findsOneWidget);
  });

  testWidgets('HamburgerMenu should display menu items',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: HamburgerMenu(),
    ));

    expect(find.text('Gerenciar clientes'), findsOneWidget);
    expect(find.text('Tipos de clientes'), findsOneWidget);
    expect(find.text('Sair'), findsOneWidget);
  });
}
