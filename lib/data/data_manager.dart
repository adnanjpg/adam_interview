import 'package:hive_flutter/hive_flutter.dart';

abstract class DataManager {
  static Future<List<T>> readListData<T>(String boxName) async {
    final box = await Hive.openBox(boxName);

    final initVals = box.values;

    final data = List<T>.from(initVals);

    return data;
  }

  static Stream<List<T>> listenToListData<T>(String boxName) async* {
    final initVals = await readListData(boxName);

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
}
