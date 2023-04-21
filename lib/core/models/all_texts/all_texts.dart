// To parse this JSON data, do
//
//     final allTexts = allTextsFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'all_texts.freezed.dart';
part 'all_texts.g.dart';

@freezed
class AllTexts with _$AllTexts {
    const factory AllTexts({
        String? message,
        List<String>? data,
        String? status,
    }) = _AllTexts;

    factory AllTexts.fromJson(Map<String, dynamic> json) => _$AllTextsFromJson(json);
}
