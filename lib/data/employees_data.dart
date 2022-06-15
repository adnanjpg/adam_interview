import 'package:hive_flutter/hive_flutter.dart';

import '../models/junior_employee.dart';
import '../models/senior_employee.dart';
import '../utils/consts.dart';

abstract class EmployeesData {
  static Stream<List<T>> _listenToListData<T>(String boxName) async* {
    await Hive.openBox(boxName);

    final initVals = Hive.box(boxName).values;

    final data = List<T>.from(initVals);

    yield data;

    await for (final event in Hive.box(boxName).watch()) {
      final isDelete = event.deleted;

      final T val = event.value;

      if (isDelete) {
        data.remove(val);
      } else {
        data.add(val);
      }

      yield data;
    }
  }

  static Stream<List<SeniorEmployee>> getSeniorEmployees() {
    return _listenToListData<SeniorEmployee>(seniorEmployeesBoxName);
  }

  static Stream<List<JuniorEmployee>> getJuniorEmployees() {
    return _listenToListData<JuniorEmployee>(juniorEmployeesBoxName);
  }
}
