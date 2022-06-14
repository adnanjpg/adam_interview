import 'package:freezed_annotation/freezed_annotation.dart';

part 'junior_employee.freezed.dart';

@freezed
class JuniorEmployee with _$JuniorEmployee {
  const JuniorEmployee._();

  const factory JuniorEmployee({
    required int id,
    required String name,
    required int relatedTo,
    int? taskId,
  }) = _JuniorEmployee;
}
