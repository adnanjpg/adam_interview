import '../../ui/employees/employee_list.dart';
import '../../ui/tasks/task_list.dart';
import 'package:flutter/material.dart';

enum BottomBarIndex {
  tasks,
  employees;

  IconData get icon {
    switch (this) {
      case BottomBarIndex.tasks:
        return Icons.list;
      case BottomBarIndex.employees:
        return Icons.people;
    }
  }

  String get title {
    switch (this) {
      case BottomBarIndex.tasks:
        return 'Tasks';
      case BottomBarIndex.employees:
        return 'Employees';
    }
  }

  Widget get body {
    switch (this) {
      case BottomBarIndex.tasks:
        return const TaskList();
      case BottomBarIndex.employees:
        return const EmployeeList();
    }
  }
}
