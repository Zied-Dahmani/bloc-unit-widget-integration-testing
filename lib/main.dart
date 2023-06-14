import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/data/repositories/operation_repository.dart';
import 'package:flutter_practice/logic/blocs/calculator_bloc.dart';
import 'package:flutter_practice/presentation/screens/calculator_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoC Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => CalculatorBloc(
          operationRepository: OperationRepository(),
        ),
        child: CalculatorScreen(),
      ),
    );
  }
}
