import 'package:flutter/material.dart';

import '../../ui/employees/employee_list.dart';
import '../../ui/tasks/task_list.dart';
import '../../ui/teams/teams_list.dart';

enum BottomBarIndex {
  tasks,
  employees,
  teams;

  IconData get icon {
    switch (this) {
      case BottomBarIndex.tasks:
        return Icons.list;
      case BottomBarIndex.employees:
        return Icons.people;
      case BottomBarIndex.teams:
        return Icons.group;
    }
  }

  String get title {
    switch (this) {
      case BottomBarIndex.tasks:
        return 'Tasks';
      case BottomBarIndex.employees:
        return 'Employees';
      case BottomBarIndex.teams:
        return 'Teams';
    }
  }

  Widget get body {
    switch (this) {
      case BottomBarIndex.tasks:
        return const TaskList();
      case BottomBarIndex.employees:
        return const EmployeeList();
      case BottomBarIndex.teams:
        return const TeamsList();
    }
  }
}
