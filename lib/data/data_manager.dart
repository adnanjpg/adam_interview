import 'package:hive_flutter/hive_flutter.dart';

abstract class DataManager {
  static Future<List<T>> readListData<T>(String boxName) async {
    final box = await Hive.openBox(boxName);

    final initVals = box.values;

    final data = List<T>.from(initVals);

    return data;
  }

  static Stream<List<T>> listenToListData<T>({
    required String boxName,
    required bool Function(T, T) compare,
  }) async* {
    final initVals = await readListData(boxName);

    final data = List<T>.from(initVals);

    yield data;

    await for (final event in Hive.box(boxName).watch()) {
      final isDelete = event.deleted;

      final T? val = event.value;

      if (isDelete || val == null) {
        return;
      }

      final alreadyExists = data.any((element) => compare(element, val));
      // if alreadyExists, call updateValueWhere
      if (alreadyExists) {
        await updateValueWhere<T>(
          boxName: boxName,
          predicate: (e) => compare(e, val),
          newValue: val,
        );
      } else {
        data.add(val);
      }

      yield data;
    }
  }

  static Future<void> updateValueWhere<T>({
    required String boxName,
    required bool Function(T) predicate,
    required T newValue,
  }) async {
    final initVals = await DataManager.readListData(boxName);

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
}
