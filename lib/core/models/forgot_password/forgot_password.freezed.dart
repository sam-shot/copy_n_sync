// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ForgotPassword _$ForgotPasswordFromJson(Map<String, dynamic> json) {
  return _ForgotPassword.fromJson(json);
}

/// @nodoc
mixin _$ForgotPassword {
  String? get message => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForgotPasswordCopyWith<ForgotPassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordCopyWith<$Res> {
  factory $ForgotPasswordCopyWith(
          ForgotPassword value, $Res Function(ForgotPassword) then) =
      _$ForgotPasswordCopyWithImpl<$Res, ForgotPassword>;
  @useResult
  $Res call({String? message, String? code, String? status});
}

/// @nodoc
class _$ForgotPasswordCopyWithImpl<$Res, $Val extends ForgotPassword>
    implements $ForgotPasswordCopyWith<$Res> {
  _$ForgotPasswordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ForgotPasswordCopyWith<$Res>
    implements $ForgotPasswordCopyWith<$Res> {
  factory _$$_ForgotPasswordCopyWith(
          _$_ForgotPassword value, $Res Function(_$_ForgotPassword) then) =
      __$$_ForgotPasswordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, String? code, String? status});
}

/// @nodoc
class __$$_ForgotPasswordCopyWithImpl<$Res>
    extends _$ForgotPasswordCopyWithImpl<$Res, _$_ForgotPassword>
    implements _$$_ForgotPasswordCopyWith<$Res> {
  __$$_ForgotPasswordCopyWithImpl(
      _$_ForgotPassword _value, $Res Function(_$_ForgotPassword) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_ForgotPassword(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ForgotPassword implements _ForgotPassword {
  const _$_ForgotPassword({this.message, this.code, this.status});

  factory _$_ForgotPassword.fromJson(Map<String, dynamic> json) =>
      _$$_ForgotPasswordFromJson(json);

  @override
  final String? message;
  @override
  final String? code;
  @override
  final String? status;

  @override
  String toString() {
    return 'ForgotPassword(message: $message, code: $code, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForgotPassword &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, code, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ForgotPasswordCopyWith<_$_ForgotPassword> get copyWith =>
      __$$_ForgotPasswordCopyWithImpl<_$_ForgotPassword>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ForgotPasswordToJson(
      this,
    );
  }
}

abstract class _ForgotPassword implements ForgotPassword {
  const factory _ForgotPassword(
      {final String? message,
      final String? code,
      final String? status}) = _$_ForgotPassword;

  factory _ForgotPassword.fromJson(Map<String, dynamic> json) =
      _$_ForgotPassword.fromJson;

  @override
  String? get message;
  @override
  String? get code;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$_ForgotPasswordCopyWith<_$_ForgotPassword> get copyWith =>
      throw _privateConstructorUsedError;
}
