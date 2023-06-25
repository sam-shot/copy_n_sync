// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'register.freezed.dart';
part 'register.g.dart';

@freezed
class Register with _$Register {
    const factory Register({
        String? message,
        Data? data,
        String? status,
    }) = _Register;

    factory Register.fromJson(Map<String, dynamic> json) => _$RegisterFromJson(json);
}

@freezed
class Data with _$Data {
    const factory Data({
        String? name,
        String? email,
        String? username,
        String? password,
    }) = _Data;

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
