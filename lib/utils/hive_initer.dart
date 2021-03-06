import 'package:hive_flutter/hive_flutter.dart';

import '../models/junior_employee.dart';
import '../models/senior_employee.dart';
import '../models/task.dart';

abstract class HiveIniter {
  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(SeniorEmployeeAdapter());
    Hive.registerAdapter(JuniorEmployeeAdapter());
    Hive.registerAdapter(TaskAdapter());
  }
}
