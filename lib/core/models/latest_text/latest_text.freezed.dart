// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'latest_text.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LatestText _$LatestTextFromJson(Map<String, dynamic> json) {
  return _LatestText.fromJson(json);
}

/// @nodoc
mixin _$LatestText {
  String? get message => throw _privateConstructorUsedError;
  Data? get data => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LatestTextCopyWith<LatestText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LatestTextCopyWith<$Res> {
  factory $LatestTextCopyWith(
          LatestText value, $Res Function(LatestText) then) =
      _$LatestTextCopyWithImpl<$Res, LatestText>;
  @useResult
  $Res call({String? message, Data? data, String? status});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$LatestTextCopyWithImpl<$Res, $Val extends LatestText>
    implements $LatestTextCopyWith<$Res> {
  _$LatestTextCopyWithImpl(this._value, this._then);

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
              as Data?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LatestTextCopyWith<$Res>
    implements $LatestTextCopyWith<$Res> {
  factory _$$_LatestTextCopyWith(
          _$_LatestText value, $Res Function(_$_LatestText) then) =
      __$$_LatestTextCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, Data? data, String? status});

  @override
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_LatestTextCopyWithImpl<$Res>
    extends _$LatestTextCopyWithImpl<$Res, _$_LatestText>
    implements _$$_LatestTextCopyWith<$Res> {
  __$$_LatestTextCopyWithImpl(
      _$_LatestText _value, $Res Function(_$_LatestText) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? data = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_LatestText(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LatestText implements _LatestText {
  const _$_LatestText({this.message, this.data, this.status});

  factory _$_LatestText.fromJson(Map<String, dynamic> json) =>
      _$$_LatestTextFromJson(json);

  @override
  final String? message;
  @override
  final Data? data;
  @override
  final String? status;

  @override
  String toString() {
    return 'LatestText(message: $message, data: $data, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LatestText &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, data, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LatestTextCopyWith<_$_LatestText> get copyWith =>
      __$$_LatestTextCopyWithImpl<_$_LatestText>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LatestTextToJson(
      this,
    );
  }
}

abstract class _LatestText implements LatestText {
  const factory _LatestText(
      {final String? message,
      final Data? data,
      final String? status}) = _$_LatestText;

  factory _LatestText.fromJson(Map<String, dynamic> json) =
      _$_LatestText.fromJson;

  @override
  String? get message;
  @override
  Data? get data;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$_LatestTextCopyWith<_$_LatestText> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  String? get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call({String? text});
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$_DataCopyWith(_$_Data value, $Res Function(_$_Data) then) =
      __$$_DataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? text});
}

/// @nodoc
class __$$_DataCopyWithImpl<$Res> extends _$DataCopyWithImpl<$Res, _$_Data>
    implements _$$_DataCopyWith<$Res> {
  __$$_DataCopyWithImpl(_$_Data _value, $Res Function(_$_Data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_$_Data(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Data implements _Data {
  const _$_Data({this.text});

  factory _$_Data.fromJson(Map<String, dynamic> json) => _$$_DataFromJson(json);

  @override
  final String? text;

  @override
  String toString() {
    return 'Data(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataCopyWith<_$_Data> get copyWith =>
      __$$_DataCopyWithImpl<_$_Data>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  const factory _Data({final String? text}) = _$_Data;

  factory _Data.fromJson(Map<String, dynamic> json) = _$_Data.fromJson;

  @override
  String? get text;
  @override
  @JsonKey(ignore: true)
  _$$_DataCopyWith<_$_Data> get copyWith => throw _privateConstructorUsedError;
}
