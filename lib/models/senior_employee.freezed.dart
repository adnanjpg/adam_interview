// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'senior_employee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SeniorEmployee {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  List<int> get juniorIds => throw _privateConstructorUsedError;
  @HiveField(3)
  int? get taskId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SeniorEmployeeCopyWith<SeniorEmployee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeniorEmployeeCopyWith<$Res> {
  factory $SeniorEmployeeCopyWith(
          SeniorEmployee value, $Res Function(SeniorEmployee) then) =
      _$SeniorEmployeeCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String name,
      @HiveField(2) List<int> juniorIds,
      @HiveField(3) int? taskId});
}

/// @nodoc
class _$SeniorEmployeeCopyWithImpl<$Res>
    implements $SeniorEmployeeCopyWith<$Res> {
  _$SeniorEmployeeCopyWithImpl(this._value, this._then);

  final SeniorEmployee _value;
  // ignore: unused_field
  final $Res Function(SeniorEmployee) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? juniorIds = freezed,
    Object? taskId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      juniorIds: juniorIds == freezed
          ? _value.juniorIds
          : juniorIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      taskId: taskId == freezed
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_SeniorEmployeeCopyWith<$Res>
    implements $SeniorEmployeeCopyWith<$Res> {
  factory _$$_SeniorEmployeeCopyWith(
          _$_SeniorEmployee value, $Res Function(_$_SeniorEmployee) then) =
      __$$_SeniorEmployeeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String name,
      @HiveField(2) List<int> juniorIds,
      @HiveField(3) int? taskId});
}

/// @nodoc
class __$$_SeniorEmployeeCopyWithImpl<$Res>
    extends _$SeniorEmployeeCopyWithImpl<$Res>
    implements _$$_SeniorEmployeeCopyWith<$Res> {
  __$$_SeniorEmployeeCopyWithImpl(
      _$_SeniorEmployee _value, $Res Function(_$_SeniorEmployee) _then)
      : super(_value, (v) => _then(v as _$_SeniorEmployee));

  @override
  _$_SeniorEmployee get _value => super._value as _$_SeniorEmployee;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? juniorIds = freezed,
    Object? taskId = freezed,
  }) {
    return _then(_$_SeniorEmployee(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      juniorIds: juniorIds == freezed
          ? _value._juniorIds
          : juniorIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      taskId: taskId == freezed
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_SeniorEmployee extends _SeniorEmployee {
  const _$_SeniorEmployee(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) final List<int> juniorIds = const [],
      @HiveField(3) this.taskId})
      : _juniorIds = juniorIds,
        super._();

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String name;
  final List<int> _juniorIds;
  @override
  @JsonKey()
  @HiveField(2)
  List<int> get juniorIds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_juniorIds);
  }

  @override
  @HiveField(3)
  final int? taskId;

  @override
  String toString() {
    return 'SeniorEmployee(id: $id, name: $name, juniorIds: $juniorIds, taskId: $taskId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SeniorEmployee &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other._juniorIds, _juniorIds) &&
            const DeepCollectionEquality().equals(other.taskId, taskId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(_juniorIds),
      const DeepCollectionEquality().hash(taskId));

  @JsonKey(ignore: true)
  @override
  _$$_SeniorEmployeeCopyWith<_$_SeniorEmployee> get copyWith =>
      __$$_SeniorEmployeeCopyWithImpl<_$_SeniorEmployee>(this, _$identity);
}

abstract class _SeniorEmployee extends SeniorEmployee {
  const factory _SeniorEmployee(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String name,
      @HiveField(2) final List<int> juniorIds,
      @HiveField(3) final int? taskId}) = _$_SeniorEmployee;
  const _SeniorEmployee._() : super._();

  @override
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  List<int> get juniorIds => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  int? get taskId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SeniorEmployeeCopyWith<_$_SeniorEmployee> get copyWith =>
      throw _privateConstructorUsedError;
}
