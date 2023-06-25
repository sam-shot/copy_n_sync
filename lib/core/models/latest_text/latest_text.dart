// To parse this JSON data, do
//
//     final latestText = latestTextFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'latest_text.freezed.dart';
part 'latest_text.g.dart';

@freezed
class LatestText with _$LatestText {
    const factory LatestText({
        String? message,
        Data? data,
        String? status,
    }) = _LatestText;

    factory LatestText.fromJson(Map<String, dynamic> json) => _$LatestTextFromJson(json);
}

@freezed
class Data with _$Data {
    const factory Data({
        String? text,
    }) = _Data;

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
