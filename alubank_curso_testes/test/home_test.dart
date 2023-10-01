import 'package:estilizacao_componentes/components/box_card.dart';
import 'package:estilizacao_componentes/data/bank_http.mocks.dart';
import 'package:estilizacao_componentes/data/bank_inherited.dart';
import 'package:estilizacao_componentes/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  final MockBankHttp mockBankHttp = MockBankHttp();

  testWidgets(
    'My widget has a text "Spent"',
    (WidgetTester tester) async {
      when(mockBankHttp.dolarToReal()).thenAnswer((_) async => ('5'));
      await tester.pumpWidget(
        MaterialApp(
          home: BankInherited(
            child: Home(
              api: mockBankHttp.dolarToReal(),
            ),
          ),
        ),
      );
      final spentFinder = find.text('Spent');
      expect(spentFinder, findsOneWidget);
    },
  );
  testWidgets(
    'Finds a LinearProgressIndicator',
    (tester) async {
      when(mockBankHttp.dolarToReal()).thenAnswer((_) async => ('5'));
      await tester.pumpWidget(
        MaterialApp(
          home: BankInherited(
            child: Home(
              api: mockBankHttp.dolarToReal(),
            ),
          ),
        ),
      );
      expect(find.byType(LinearProgressIndicator), findsOneWidget);
    },
  );
  testWidgets(
    'Finds a AccountStatus',
    (tester) async {
      when(mockBankHttp.dolarToReal()).thenAnswer((_) async => ('5'));
      await tester.pumpWidget(
        MaterialApp(
          home: BankInherited(
            child: Home(
              api: mockBankHttp.dolarToReal(),
            ),
          ),
        ),
      );
      expect(find.byKey(const Key('testKey')), findsOneWidget);
    },
  );

  testWidgets('Finds 5 BoxCards', (tester) async {
    when(mockBankHttp.dolarToReal()).thenAnswer((_) async => ('5'));
    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: Home(
            api: mockBankHttp.dolarToReal(),
          ),
        ),
      ),
    );
    expect(find.byWidgetPredicate((widget) {
      if (widget is BoxCard) {
        return true;
      } else {
        return false;
      }
    }), findsNWidgets(5));
  });

  testWidgets('When tap Deposit should upload earned in 10', (tester) async {
    when(mockBankHttp.dolarToReal()).thenAnswer((_) async => ('5'));
    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: Home(
            api: mockBankHttp.dolarToReal(),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Deposit'));
    await tester.tap(find.text('Earned'));
    await tester.pumpAndSettle();
    expect(find.text('\$10.0'), findsOneWidget);
  });

  testWidgets('Testing MockHttp dolarToReal', (tester) async {
    reset(mockBankHttp);
    when(mockBankHttp.dolarToReal()).thenAnswer((_) async => ('5'));
    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: Home(
            api: mockBankHttp.dolarToReal(),
          ),
        ),
      ),
    );
    verify(mockBankHttp.dolarToReal()).called(1);
  });
}
