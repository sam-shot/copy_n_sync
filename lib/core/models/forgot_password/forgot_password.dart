// To parse this JSON data, do
//
//     final forgotPassword = forgotPasswordFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password.freezed.dart';
part 'forgot_password.g.dart';



@freezed
class ForgotPassword with _$ForgotPassword {
    const factory ForgotPassword({
        String? message,
        String? code,
        String? status,
    }) = _ForgotPassword;

    factory ForgotPassword.fromJson(Map<String, dynamic> json) => _$ForgotPasswordFromJson(json);
}
