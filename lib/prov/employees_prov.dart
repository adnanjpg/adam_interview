import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/employees_data.dart';
import '../models/junior_employee.dart';
import '../models/senior_employee.dart';

final seniorEmployeesProv = StreamProvider<List<SeniorEmployee>>(
  (ref) => EmployeesData.getSeniorEmployees(),
);

final juniorEmployeesProv = StreamProvider<List<JuniorEmployee>>(
  (ref) => EmployeesData.getJuniorEmployees(),
);
