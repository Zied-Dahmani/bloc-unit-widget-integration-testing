import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_practice/data/repositories/operation_repository.dart';
import 'package:flutter_practice/logic/blocs/calculator_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Calculator BLoC unit test', () {
    late CalculatorBloc calculatorBloc;

    setUp(() {
      calculatorBloc = CalculatorBloc(operationRepository: OperationRepository());
    });

    test('Initial test', () {
      expect(calculatorBloc.state, const CalculatorInitial());
    });

    blocTest<CalculatorBloc, CalculatorState>(
      'emits [ClaculatorResultSuccessful(10.0)] when addButtonTapped(5, 5) is added.',
      build: () => calculatorBloc,
      act: (bloc) => bloc.add(const AddButtonTapped(5, 5)),
      expect: () => const <CalculatorState>[CalculatorResultSuccessful(10.0)],
    );

    blocTest<CalculatorBloc, CalculatorState>(
      'emits [ClaculatorResultSuccessful(0.0)] when SubtractButtonTapped(5, 5) is added.',
      build: () => calculatorBloc,
      act: (bloc) => bloc.add(const SubtractButtonTapped(5, 5)),
      expect: () => const <CalculatorState>[CalculatorResultSuccessful(0.0)],
    );

    blocTest<CalculatorBloc, CalculatorState>(
      'emits [ClaculatorResultSuccessful(25.0)] when MultiplyButtonTapped(5, 5) is added.',
      build: () => calculatorBloc,
      act: (bloc) => bloc.add(const MultiplyButtonTapped(5, 5)),
      expect: () => const <CalculatorState>[CalculatorResultSuccessful(25.0)],
    );

    blocTest<CalculatorBloc, CalculatorState>(
      'emits [CalculatorSuccessful(1.0)] when DivideButtonTapped(5, 5) is added.',
      build: () => calculatorBloc,
      act: (bloc) => bloc.add(const DivideButtonTapped(5, 5)),
      expect: () => const <CalculatorState>[CalculatorResultSuccessful(1.0)],
    );
  });
}
