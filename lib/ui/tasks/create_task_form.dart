import 'package:flutter/material.dart';

import '../../data/employees_data.dart';
import '../../data/tasks_data.dart';
import '../../models/senior_employee.dart';
import '../../models/task.dart';

class CreateTaskForm extends StatefulWidget {
  const CreateTaskForm({Key? key}) : super(key: key);

  @override
  State<CreateTaskForm> createState() => _CreateTaskFormState();
}

class _CreateTaskFormState extends State<CreateTaskForm> {
  Task task = const Task(
    id: null,
    name: '',
    description: '',
  );

  SeniorEmployee? selectedSenior;

  final formKey = GlobalKey<FormState>();

  bool verifyForm() {
    final seniorIsNull = selectedSenior == null;

    if (seniorIsNull) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Senior is required'),
        ),
      );
      return false;
    }
    return formKey.currentState?.validate() == true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            TextFormField(
              initialValue: task.name,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              onChanged: (value) {
                task = task.copyWith(name: value);
                setState(() {});
              },
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Name is required';
                }
                return null;
              },
            ),
            TextFormField(
              initialValue: task.description,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
              maxLines: 4,
              onChanged: (value) {
                task = task.copyWith(description: value);
                setState(() {});
              },
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Description is required';
                }
                return null;
              },
            ),
            _SeniorSelector(
              onSelected: (senior) {
                selectedSenior = senior;
                setState(() {});
              },
            ),
            ElevatedButton(
              child: const Text('Create'),
              onPressed: () {
                if (verifyForm()) {
                  TasksData.createTask(
                    task: task,
                    senior: selectedSenior!,
                  );
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SeniorSelector extends StatefulWidget {
  final void Function(SeniorEmployee?) onSelected;
  const _SeniorSelector({
    required this.onSelected,
    Key? key,
  }) : super(key: key);

  @override
  State<_SeniorSelector> createState() => __SeniorSelectorState();
}

class __SeniorSelectorState extends State<_SeniorSelector> {
  SeniorEmployee? selectedSenior;

  late final Future<List<SeniorEmployee>> myFuture =
      EmployeesData.readAvailableSeniorEmployees();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: myFuture,
      builder: (context, snp) {
        if (snp.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snp.hasError) {
          return const Center(
            child: Text('Error'),
          );
        }

        final employees = snp.data as List<SeniorEmployee>;

        return DropdownButtonFormField<SeniorEmployee>(
          decoration: const InputDecoration(
            labelText: 'Senior',
          ),
          value: selectedSenior,
          onChanged: (value) {
            selectedSenior = value;
            widget.onSelected(value);
            setState(() {});
          },
          items: employees.map((employee) {
            return DropdownMenuItem(
              value: employee,
              child: Text(employee.name),
            );
          }).toList(),
        );
      },
    );
  }
}
