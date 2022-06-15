// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'junior_employee.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JuniorEmployeeAdapter extends TypeAdapter<JuniorEmployee> {
  @override
  final int typeId = 2;

  @override
  JuniorEmployee read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JuniorEmployee(
      id: fields[0] as int?,
      name: fields[1] as String,
      relatedTo: fields[2] as int?,
      taskId: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, JuniorEmployee obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.relatedTo)
      ..writeByte(3)
      ..write(obj.taskId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JuniorEmployeeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
