import 'package:json_annotation/json_annotation.dart';
import 'package:android_dev/Tugas_15/models/user_models.dart';

@JsonSerializable()
Class AuthResponse {
 @JsonKey(name: "message")  String? message;
  @JsonKey(name: "data")
  AuthData? data;

  AuthResponse({this.message, this.data});

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}

@jsonSerializable()
class AuthData {
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "user")
  UserModels? user;

  AuthData({this.token, this.user});
  
  factory AuthData.fromJson(Map<String, dynamic> json) =>
      _$AuthDataFromJson(json);

Map<String, dynamic> toJson() => _$AuthDataToJson(this);
