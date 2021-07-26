// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserWorker _$UserWorkerFromJson(Map<String, dynamic> json) {
  return UserWorker(
    id: json['id'] as String,
    email: json['email'] as String,
    name: json['name'] as String,
    password: json['password'] as String,
    checkinStatus: json['checkin_status'] as int,
  );
}

Map<String, dynamic> _$UserWorkerToJson(UserWorker instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'password': instance.password,
      'checkin_status': instance.checkinStatus,
    };
