import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'senior_employee.freezed.dart';
part 'senior_employee.g.dart';

@freezed
@HiveType(typeId: 1)
class SeniorEmployee with _$SeniorEmployee {
  const SeniorEmployee._();

  const factory SeniorEmployee({
    @HiveField(0) required int id,
    @HiveField(1) required String name,
    @HiveField(2) @Default([]) List<int> juniorIds,
    @HiveField(3) @Default([]) List<int> taskIds,
  }) = _SeniorEmployee;
}
