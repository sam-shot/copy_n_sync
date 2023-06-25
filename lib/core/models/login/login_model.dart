// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class LoginModel with _$LoginModel {
    const factory LoginModel({
        String? message,
        Data? data,
        String? status,
    }) = _LoginModel;

    factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);
}

@freezed
class Data with _$Data {
    const factory Data({
        String? email,
        String? username,
        String? name,
        String? id,
    }) = _Data;

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
