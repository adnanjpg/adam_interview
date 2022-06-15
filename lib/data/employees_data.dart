import 'package:hive_flutter/hive_flutter.dart';

import '../models/junior_employee.dart';
import '../models/senior_employee.dart';
import '../utils/consts.dart';
import 'data_manager.dart';

abstract class EmployeesData {
  static Future<List<SeniorEmployee>> readSeniorEmployees() {
    return DataManager.readListData<SeniorEmployee>(seniorEmployeesBoxName);
  }

  static Future<List<SeniorEmployee>> readAvailableSeniorEmployees() async {
    final employees =
        await DataManager.readListData<SeniorEmployee>(seniorEmployeesBoxName);

    return employees.where((element) => element.taskIds.length < 3).toList();
  }

  static Stream<List<SeniorEmployee>> listenToSeniorEmployees() {
    return DataManager.listenToListData<SeniorEmployee>(seniorEmployeesBoxName);
  }

  static Future<List<JuniorEmployee>> getSeniorsEmployees(
      SeniorEmployee senior) async {
    final juniors = await readJuniorEmployees();

    return juniors.where(
      (element) {
        return element.relatedTo == senior.id;
      },
    ).toList();
  }

  static Future<List<JuniorEmployee>> readJuniorEmployees() {
    return DataManager.readListData<JuniorEmployee>(juniorEmployeesBoxName);
  }

  static Stream<List<JuniorEmployee>> listenToJuniorEmployees() {
    return DataManager.listenToListData<JuniorEmployee>(juniorEmployeesBoxName)
        .map(
      (event) {
        return event.where((element) => element.id != null).toList();
      },
    );
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
      for (int i = 0; i + 4 <= unteamedCount; i += 4) {
        final team = unteamed.sublist(i, i + 4);
        await convertToTeam(team);
      }
    }

    return;
  }

  static Future<void> updateJuniorEmployee(JuniorEmployee employee) async {
    await DataManager.updateValueWhere<JuniorEmployee>(
      boxName: juniorEmployeesBoxName,
      newValue: employee,
      predicate: (element) => element.id == employee.id,
    );
  }

  static Future<void> assignTaskToSenior({
    required SeniorEmployee employee,
    required int taskId,
  }) async {
    final juniors = await getSeniorsEmployees(employee);

    employee = employee.copyWith(
      taskIds: [
        ...employee.taskIds,
        taskId,
      ],
    );

    await updateSeniorEmployee(employee);

    // now, we wanna assign to the first available junior

    for (var junior in juniors) {
      if (junior.taskId == null) {
        junior = junior.copyWith(taskId: taskId);
        await updateJuniorEmployee(junior);
        break;
      }
    }
  }

  static Future<void> updateSeniorEmployee(SeniorEmployee employee) async {
    await DataManager.updateValueWhere<SeniorEmployee>(
      boxName: seniorEmployeesBoxName,
      newValue: employee,
      predicate: (element) => element.id == employee.id,
    );
  }
}
