// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_texts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AllTexts _$AllTextsFromJson(Map<String, dynamic> json) {
  return _AllTexts.fromJson(json);
}

/// @nodoc
mixin _$AllTexts {
  String? get message => throw _privateConstructorUsedError;
  List<String>? get data => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllTextsCopyWith<AllTexts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllTextsCopyWith<$Res> {
  factory $AllTextsCopyWith(AllTexts value, $Res Function(AllTexts) then) =
      _$AllTextsCopyWithImpl<$Res, AllTexts>;
  @useResult
  $Res call({String? message, List<String>? data, String? status});
}

/// @nodoc
class _$AllTextsCopyWithImpl<$Res, $Val extends AllTexts>
    implements $AllTextsCopyWith<$Res> {
  _$AllTextsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? data = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AllTextsCopyWith<$Res> implements $AllTextsCopyWith<$Res> {
  factory _$$_AllTextsCopyWith(
          _$_AllTexts value, $Res Function(_$_AllTexts) then) =
      __$$_AllTextsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, List<String>? data, String? status});
}

/// @nodoc
class __$$_AllTextsCopyWithImpl<$Res>
    extends _$AllTextsCopyWithImpl<$Res, _$_AllTexts>
    implements _$$_AllTextsCopyWith<$Res> {
  __$$_AllTextsCopyWithImpl(
      _$_AllTexts _value, $Res Function(_$_AllTexts) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? data = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_AllTexts(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AllTexts implements _AllTexts {
  const _$_AllTexts({this.message, final List<String>? data, this.status})
      : _data = data;

  factory _$_AllTexts.fromJson(Map<String, dynamic> json) =>
      _$$_AllTextsFromJson(json);

  @override
  final String? message;
  final List<String>? _data;
  @override
  List<String>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? status;

  @override
  String toString() {
    return 'AllTexts(message: $message, data: $data, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AllTexts &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_data), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AllTextsCopyWith<_$_AllTexts> get copyWith =>
      __$$_AllTextsCopyWithImpl<_$_AllTexts>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AllTextsToJson(
      this,
    );
  }
}

abstract class _AllTexts implements AllTexts {
  const factory _AllTexts(
      {final String? message,
      final List<String>? data,
      final String? status}) = _$_AllTexts;

  factory _AllTexts.fromJson(Map<String, dynamic> json) = _$_AllTexts.fromJson;

  @override
  String? get message;
  @override
  List<String>? get data;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$_AllTextsCopyWith<_$_AllTexts> get copyWith =>
      throw _privateConstructorUsedError;
}
