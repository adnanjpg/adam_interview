import '../../data/employees_data.dart';
import '../../models/junior_employee.dart';
import 'package:flutter/material.dart';

class CreateJuniorEmployeeForm extends StatefulWidget {
  const CreateJuniorEmployeeForm({Key? key}) : super(key: key);

  @override
  State<CreateJuniorEmployeeForm> createState() =>
      _CreateJuniorEmployeeFormState();
}

class _CreateJuniorEmployeeFormState extends State<CreateJuniorEmployeeForm> {
  JuniorEmployee employee = const JuniorEmployee(
    id: null,
    name: '',
  );

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        children: [
          TextFormField(
            initialValue: employee.name,
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
            onChanged: (value) {
              employee = employee.copyWith(name: value);
              setState(() {});
            },
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Name is required';
              }
              return null;
            },
          ),
          ElevatedButton(
            child: const Text('Create'),
            onPressed: () {
              if (formKey.currentState?.validate() == true) {
                EmployeesData.createJuniorEmployee(employee);
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
    );
  }
}
