import 'employees_data.dart';
import '../models/senior_employee.dart';
import '../models/task.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../utils/consts.dart';
import 'data_manager.dart';

abstract class TasksData {
  static Future<List<Task>> readTasks() {
    return DataManager.readListData<Task>(tasksBoxName);
  }

  static Stream<List<Task>> listenToTasks() {
    return DataManager.listenToListData<Task>(tasksBoxName);
  }

  static Future<SeniorEmployee> taskOwnerSenior(Task task) async {
    final seniors = await EmployeesData.readSeniorEmployees();

    return seniors.firstWhere(
      (element) {
        return element.taskIds.contains(task.id);
      },
    );
  }

  static Future<void> createTask({
    required Task task,
    required SeniorEmployee senior,
  }) async {
    final box = await Hive.openBox(tasksBoxName);

    final boxVals = box.values;
    Task? lastTask;
    if (boxVals.isNotEmpty) {
      lastTask = boxVals.last as Task?;
    }

    int id;

    if (lastTask == null) {
      id = 0;
    } else {
      id = lastTask.id! + 1;
    }

    task = task.copyWith(id: id);

    await box.add(task);

    await EmployeesData.assignTaskToSenior(
      employee: senior,
      taskId: task.id!,
    );
  }

  static Future<void> updateTask(Task task) async {
    await DataManager.updateValueWhere<Task>(
      boxName: tasksBoxName,
      newValue: task,
      predicate: (element) => element.id == task.id,
    );
  }
}
