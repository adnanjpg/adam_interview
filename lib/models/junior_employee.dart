import 'senior_employee.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'junior_employee.freezed.dart';
part 'junior_employee.g.dart';

@freezed
@HiveType(typeId: 2)
class JuniorEmployee with _$JuniorEmployee {
  const JuniorEmployee._();

  const factory JuniorEmployee({
    @HiveField(0) required int? id,
    @HiveField(1) required String name,
    @HiveField(2) int? relatedTo,
    @HiveField(3) int? taskId,
  }) = _JuniorEmployee;

  SeniorEmployee toSenior({required List<int> juniorIds}) {
    return SeniorEmployee(
      id: id!,
      name: name,
      juniorIds: juniorIds,
    );
  }
}
