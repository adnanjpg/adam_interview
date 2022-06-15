import '../../models/junior_employee.dart';
import 'package:flutter/material.dart';

class JuniorEmployeeLI extends StatelessWidget {
  final JuniorEmployee employee;
  const JuniorEmployeeLI({
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
