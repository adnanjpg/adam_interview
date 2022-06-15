// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'junior_employee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$JuniorEmployee {
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  int? get relatedTo => throw _privateConstructorUsedError;
  @HiveField(3)
  int? get taskId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $JuniorEmployeeCopyWith<JuniorEmployee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JuniorEmployeeCopyWith<$Res> {
  factory $JuniorEmployeeCopyWith(
          JuniorEmployee value, $Res Function(JuniorEmployee) then) =
      _$JuniorEmployeeCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) String name,
      @HiveField(2) int? relatedTo,
      @HiveField(3) int? taskId});
}

/// @nodoc
class _$JuniorEmployeeCopyWithImpl<$Res>
    implements $JuniorEmployeeCopyWith<$Res> {
  _$JuniorEmployeeCopyWithImpl(this._value, this._then);

  final JuniorEmployee _value;
  // ignore: unused_field
  final $Res Function(JuniorEmployee) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? relatedTo = freezed,
    Object? taskId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      relatedTo: relatedTo == freezed
          ? _value.relatedTo
          : relatedTo // ignore: cast_nullable_to_non_nullable
              as int?,
      taskId: taskId == freezed
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_JuniorEmployeeCopyWith<$Res>
    implements $JuniorEmployeeCopyWith<$Res> {
  factory _$$_JuniorEmployeeCopyWith(
          _$_JuniorEmployee value, $Res Function(_$_JuniorEmployee) then) =
      __$$_JuniorEmployeeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) String name,
      @HiveField(2) int? relatedTo,
      @HiveField(3) int? taskId});
}

/// @nodoc
class __$$_JuniorEmployeeCopyWithImpl<$Res>
    extends _$JuniorEmployeeCopyWithImpl<$Res>
    implements _$$_JuniorEmployeeCopyWith<$Res> {
  __$$_JuniorEmployeeCopyWithImpl(
      _$_JuniorEmployee _value, $Res Function(_$_JuniorEmployee) _then)
      : super(_value, (v) => _then(v as _$_JuniorEmployee));

  @override
  _$_JuniorEmployee get _value => super._value as _$_JuniorEmployee;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? relatedTo = freezed,
    Object? taskId = freezed,
  }) {
    return _then(_$_JuniorEmployee(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      relatedTo: relatedTo == freezed
          ? _value.relatedTo
          : relatedTo // ignore: cast_nullable_to_non_nullable
              as int?,
      taskId: taskId == freezed
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_JuniorEmployee extends _JuniorEmployee {
  const _$_JuniorEmployee(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) this.relatedTo,
      @HiveField(3) this.taskId})
      : super._();

  @override
  @HiveField(0)
  final int? id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final int? relatedTo;
  @override
  @HiveField(3)
  final int? taskId;

  @override
  String toString() {
    return 'JuniorEmployee(id: $id, name: $name, relatedTo: $relatedTo, taskId: $taskId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JuniorEmployee &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.relatedTo, relatedTo) &&
            const DeepCollectionEquality().equals(other.taskId, taskId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(relatedTo),
      const DeepCollectionEquality().hash(taskId));

  @JsonKey(ignore: true)
  @override
  _$$_JuniorEmployeeCopyWith<_$_JuniorEmployee> get copyWith =>
      __$$_JuniorEmployeeCopyWithImpl<_$_JuniorEmployee>(this, _$identity);
}

abstract class _JuniorEmployee extends JuniorEmployee {
  const factory _JuniorEmployee(
      {@HiveField(0) required final int? id,
      @HiveField(1) required final String name,
      @HiveField(2) final int? relatedTo,
      @HiveField(3) final int? taskId}) = _$_JuniorEmployee;
  const _JuniorEmployee._() : super._();

  @override
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  int? get relatedTo => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  int? get taskId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_JuniorEmployeeCopyWith<_$_JuniorEmployee> get copyWith =>
      throw _privateConstructorUsedError;
}
