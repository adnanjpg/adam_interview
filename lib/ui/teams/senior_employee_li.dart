import 'package:adam_interview/models/senior_employee.dart';
import 'package:flutter/material.dart';

class SeniorEmployeeLI extends StatelessWidget {
  final SeniorEmployee employee;
  const SeniorEmployeeLI({
    required this.employee,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(employee.name),
    );
  }
}
