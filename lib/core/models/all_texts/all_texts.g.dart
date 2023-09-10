// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_texts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AllTexts _$$_AllTextsFromJson(Map<String, dynamic> json) => _$_AllTexts(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_AllTextsToJson(_$_AllTexts instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'status': instance.status,
    };

_$_Data _$$_DataFromJson(Map<String, dynamic> json) => _$_Data(
      text: json['text'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'text': instance.text,
      'time': instance.time,
    };
