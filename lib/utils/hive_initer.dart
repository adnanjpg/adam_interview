import 'package:hive_flutter/hive_flutter.dart';

import '../models/senior_employee.dart';

abstract class HiveIniter {
  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(SeniorEmployeeAdapter());
  }
}