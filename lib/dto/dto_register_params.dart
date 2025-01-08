// To parse this JSON data, do
//
//     final dtoRegisterParams = dtoRegisterParamsFromJson(jsonString);

import 'dart:convert';

DtoRegisterParams dtoRegisterParamsFromJson(String str) =>
    DtoRegisterParams.fromJson(json.decode(str));

String dtoRegisterParamsToJson(DtoRegisterParams data) =>
    json.encode(data.toJson());

class DtoRegisterParams {
  String? email;
  String? username;
  String? password;

  DtoRegisterParams({
    this.email,
    this.username,
    this.password,
  });

  factory DtoRegisterParams.fromJson(Map<String, dynamic> json) =>
      DtoRegisterParams(
        email: json["email"],
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
        "password": password,
      };
}
