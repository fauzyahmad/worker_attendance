import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class UserWorker {
  String id;
  String email;
  String name;
  String password;
  @JsonKey(name: 'checkin_status')
  int checkinStatus;

  UserWorker({
    required this.id,
    required this.email,
    required this.name,
    required this.password,
    required this.checkinStatus,
  });

  factory UserWorker.fromJson(Map<String, dynamic> json) =>
      _$UserWorkerFromJson(json);

  Map<String, dynamic> toJson() => _$UserWorkerToJson(this);
}
