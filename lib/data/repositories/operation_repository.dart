import 'operation_repository_interface.dart';


class OperationRepository implements IOperationRepository {
  @override
  int sum({required int operand1, required int operand2}) {
    return operand1 + operand2;
  }

  @override
  int difference({required int operand1, required int operand2}) {
    return operand1 - operand2;
  }

  @override
  int product({required int operand1, required int operand2}) {
    return operand1 * operand2;
  }

  @override
  double division({required int operand1, required int operand2}) {
    return operand1 / operand2;
  }

}
