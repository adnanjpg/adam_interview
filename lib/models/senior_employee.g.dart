// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'senior_employee.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SeniorEmployeeAdapter extends TypeAdapter<SeniorEmployee> {
  @override
  final int typeId = 1;

  @override
  SeniorEmployee read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SeniorEmployee(
      id: fields[0] as int,
      name: fields[1] as String,
      juniorIds: (fields[2] as List).cast<int>(),
      taskId: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, SeniorEmployee obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.juniorIds)
      ..writeByte(3)
      ..write(obj.taskId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeniorEmployeeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
