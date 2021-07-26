import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'list_checkin.g.dart';

@JsonSerializable()
class ListCheckin {
  String name;
  DateTime date;
  DateTime checkingIn;
  DateTime? checkingOut;
  DateTime? workingTime;

  ListCheckin({
    required this.name,
    required this.date,
    this.workingTime,
    required this.checkingIn,
    this.checkingOut,
  });

  factory ListCheckin.fromJson(Map<String, dynamic> json) =>
      _$ListCheckinFromJson(json);

  Map<String, dynamic> toJson() => _$ListCheckinToJson(this);
}
