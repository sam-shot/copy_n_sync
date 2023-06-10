// To parse this JSON data, do
//
//     final allTexts = allTextsFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_texts.freezed.dart';
part 'all_texts.g.dart';

@freezed
class AllTexts with _$AllTexts {
    const factory AllTexts({
        String? message,
        List<Data>? data,
        String? status,
    }) = _AllTexts;

    factory AllTexts.fromJson(Map<String, dynamic> json) => _$AllTextsFromJson(json);
}

@freezed
class Data with _$Data {
    const factory Data({
        String? text,
        String? time,
    }) = _Data;

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
