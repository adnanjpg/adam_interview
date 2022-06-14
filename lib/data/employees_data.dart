import 'package:hive_flutter/hive_flutter.dart';

import '../models/senior_employee.dart';
import '../utils/consts.dart';

abstract class EmployeesData {
  static Stream<List<SeniorEmployee>> getSeniorEmployees() async* {
    await Hive.openBox(seniorEmployeesBoxName);

    final initVals = Hive.box(seniorEmployeesBoxName).values;

    final employees = List<SeniorEmployee>.from(initVals);

    yield employees;

    await for (final event in Hive.box(seniorEmployeesBoxName).watch()) {
      final isDelete = event.deleted;

      final SeniorEmployee val = event.value;

      if (isDelete) {
        employees.remove(val);
      } else {
        employees.add(val);
      }

      yield employees;
    }
  }
}
