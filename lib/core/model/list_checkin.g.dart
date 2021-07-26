// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_checkin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCheckin _$ListCheckinFromJson(Map<String, dynamic> json) {
  return ListCheckin(
    name: json['name'] as String,
    date: DateTime.parse(json['date'] as String),
    workingTime: json['workingTime'] == null
        ? null
        : DateTime.parse(json['workingTime'] as String),
    checkingIn: DateTime.parse(json['checkingIn'] as String),
    checkingOut: json['checkingOut'] == null
        ? null
        : DateTime.parse(json['checkingOut'] as String),
  );
}

Map<String, dynamic> _$ListCheckinToJson(ListCheckin instance) =>
    <String, dynamic>{
      'name': instance.name,
      'date': instance.date.toIso8601String(),
      'checkingIn': instance.checkingIn.toIso8601String(),
      'checkingOut': instance.checkingOut?.toIso8601String(),
      'workingTime': instance.workingTime?.toIso8601String(),
    };
