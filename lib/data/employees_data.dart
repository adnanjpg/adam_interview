import 'package:hive_flutter/hive_flutter.dart';

import '../models/junior_employee.dart';
import '../models/senior_employee.dart';
import '../utils/consts.dart';

abstract class EmployeesData {
  static Future<List<T>> _readListData<T>(String boxName) async {
    final box = await Hive.openBox(boxName);

    final initVals = box.values;

    final data = List<T>.from(initVals);

    return data;
  }

  static Stream<List<T>> _listenToListData<T>(String boxName) async* {
    final initVals = await _readListData(boxName);

    final data = List<T>.from(initVals);

    yield data;

    await for (final event in Hive.box(boxName).watch()) {
      final isDelete = event.deleted;

      final T? val = event.value;

      if (isDelete) {
        data.remove(val);
      } else {
        data.add(val as T);
      }

      yield data;
    }
  }

  static Future<List<SeniorEmployee>> readSeniorEmployees() {
    return _readListData<SeniorEmployee>(seniorEmployeesBoxName);
  }

  static Stream<List<SeniorEmployee>> listenToSeniorEmployees() {
    return _listenToListData<SeniorEmployee>(seniorEmployeesBoxName);
  }

  static Future<List<JuniorEmployee>> readJuniorEmployees() {
    return _readListData<JuniorEmployee>(juniorEmployeesBoxName);
  }

  static Stream<List<JuniorEmployee>> listenToJuniorEmployees() {
    return _listenToListData<JuniorEmployee>(juniorEmployeesBoxName);
  }

  static Future<List<JuniorEmployee>> getUnteamedEmployees() async {
    final juniors = await readJuniorEmployees();

    return juniors.where((element) => element.relatedTo == null).toList();
  }

  static Future<void> convertToTeam(List<JuniorEmployee> employess) async {
    final leader = employess[0];

    final teamMembers = employess.sublist(1);

    for (var element in teamMembers) {
      element = element.copyWith(relatedTo: leader.id);
      await updateJuniorEmployee(element);
    }

    final membersIds = teamMembers.map((element) => element.id!).toList();

    final senior = leader.toSenior(juniorIds: membersIds);

    await createSeniorEmployee(senior);
  }

  static Future<void> createSeniorEmployee(SeniorEmployee employee) async {
    final box = await Hive.openBox(seniorEmployeesBoxName);

    await box.add(employee);
  }

  static Future<void> createJuniorEmployee(JuniorEmployee employee) async {
    final box = await Hive.openBox(juniorEmployeesBoxName);

    final boxVals = box.values;
    JuniorEmployee? lastEmployee;
    if (boxVals.isNotEmpty) {
      lastEmployee = boxVals.last as JuniorEmployee?;
    }

    int id;

    if (lastEmployee == null) {
      id = 0;
    } else {
      id = lastEmployee.id! + 1;
    }

    employee = employee.copyWith(id: id);

    await box.add(employee);

    // now, in our hiearchy, we have teams of a senior for each 3 juniors,
    // so when we reach to 4 juniors that are unteamed, we wanna convert the
    // first one to a senior and assign the other 3 to them.
    final unteamed = await getUnteamedEmployees();
    final unteamedCount = unteamed.length;
    if (unteamedCount >= 4) {
      // now, we may have a lot of juniors piled up in some cases,
      // so we wanna loop and convert each 4 to a team
      for (int i = 0; i + 4 < unteamedCount; i += 4) {
        final team = unteamed.sublist(i, i + 4);
        await convertToTeam(team);
      }
    }

    return;
  }

  static Future<void> updateValueWhere<T>({
    required String boxName,
    required bool Function(T) predicate,
    required T newValue,
  }) async {
    final initVals = await _readListData(boxName);

    final newVals = <T>[];

    for (final val in initVals) {
      if (predicate(val as T)) {
        newVals.add(newValue);
      } else {
        newVals.add(val);
      }
    }

    final box = await Hive.openBox(boxName);
    await box.clear();
    await box.addAll(newVals);
  }

  static Future<void> updateJuniorEmployee(JuniorEmployee employee) async {
    await updateValueWhere<JuniorEmployee>(
      boxName: juniorEmployeesBoxName,
      newValue: employee,
      predicate: (element) => element.id == employee.id,
    );
  }

  static Future<void> updateSeniorEmployee(SeniorEmployee employee) async {
    await updateValueWhere<SeniorEmployee>(
      boxName: seniorEmployeesBoxName,
      newValue: employee,
      predicate: (element) => element.id == employee.id,
    );
  }
}
