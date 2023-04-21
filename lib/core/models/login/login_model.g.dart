// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginModel _$$_LoginModelFromJson(Map<String, dynamic> json) =>
    _$_LoginModel(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_LoginModelToJson(_$_LoginModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'status': instance.status,
    };

_$_Data _$$_DataFromJson(Map<String, dynamic> json) => _$_Data(
      email: json['email'] as String?,
      username: json['username'] as String?,
      name: json['name'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'name': instance.name,
      'id': instance.id,
    };
