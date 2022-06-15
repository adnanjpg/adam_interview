import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
@HiveType(typeId: 3)
class Task with _$Task {
  const Task._();

  const factory Task({
    @HiveField(0) required int? id,
    @HiveField(1) required String name,
    @HiveField(2) required String description,
  }) = _Task;
}
