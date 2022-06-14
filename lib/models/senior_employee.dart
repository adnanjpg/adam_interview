import 'package:freezed_annotation/freezed_annotation.dart';

part 'senior_employee.freezed.dart';

@freezed
class SeniorEmployee with _$SeniorEmployee {
  const SeniorEmployee._();

  const factory SeniorEmployee({
    required int id,
    required String name,
    @Default([]) List<int> juniorIds,
    int? taskId,
  }) = _SeniorEmployee;
}
