import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_practice/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Calculator integration test', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const ValueKey('firstOperand')), '10');
    await tester.enterText(find.byKey(const ValueKey('secondOperand')), '10');

    await tester.tap(find.text('+'));
    await tester.pumpAndSettle();
    expect(find.text('20.0'), findsOneWidget);
    await tester.tap(find.text('-'));
    await tester.pumpAndSettle();
    expect(find.text('0.0'), findsOneWidget);
  });
}
