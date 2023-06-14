import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/data/repositories/operation_repository.dart';
import 'package:flutter_practice/logic/blocs/calculator_bloc.dart';
import 'package:flutter_practice/presentation/screens/calculator_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Calculator screen widget test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BlocProvider(
        create: (context) =>
            CalculatorBloc(operationRepository: OperationRepository()),
        child: CalculatorScreen(),
      ),
    ));

    expect(find.text('Result'), findsOneWidget);
    expect(find.text('+'), findsOneWidget);
    expect(find.text('-'), findsOneWidget);
    expect(find.text('*'), findsOneWidget);
    expect(find.text('/'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));

    await tester.enterText(find.byKey(const ValueKey('firstOperand')), '10');

    await tester.enterText(find.byKey(const ValueKey('secondOperand')), '10');

    await tester.tap(find.text('+'));
    await tester.pump();
    expect(find.text('20.0'), findsOneWidget);

    await tester.tap(find.text('-'));
    await tester.pump();
    expect(find.text('0.0'), findsOneWidget);
  });
}
