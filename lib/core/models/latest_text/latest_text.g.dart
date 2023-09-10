// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LatestText _$$_LatestTextFromJson(Map<String, dynamic> json) =>
    _$_LatestText(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_LatestTextToJson(_$_LatestText instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'status': instance.status,
    };

_$_Data _$$_DataFromJson(Map<String, dynamic> json) => _$_Data(
      text: json['text'] as String?,
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'text': instance.text,
    };
