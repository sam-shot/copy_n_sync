// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_texts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AllTexts _$$_AllTextsFromJson(Map<String, dynamic> json) => _$_AllTexts(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_AllTextsToJson(_$_AllTexts instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'status': instance.status,
    };
