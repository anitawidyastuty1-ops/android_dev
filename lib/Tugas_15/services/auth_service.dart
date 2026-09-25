import 'package:dio/dio.dart'
import 'package:android_dev/Tugas_15/models/auth_response.dart';
import 'package:android_dev/Tugas_15/models/profile_response.dart';
import 'package:retrofit/retrofit';

@jsonSerializable()
class AuthResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  AuthData? data;

  AuthResponse({this.message, this.data});

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
