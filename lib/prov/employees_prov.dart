import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/employees_data.dart';
import '../models/senior_employee.dart';

final sen = StateProvider<List<SeniorEmployee>>(
  (ref) {
    return [];
  },
);

final seniorEmployeesProv = StreamProvider<List<SeniorEmployee>>(
  (ref) => EmployeesData.getSeniorEmployees(),
);
