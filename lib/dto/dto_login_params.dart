// To parse this JSON data, do
//
//     final dtoLoginParams = dtoLoginParamsFromJson(jsonString);

import 'dart:convert';

DtoLoginParams dtoLoginParamsFromJson(String str) =>
    DtoLoginParams.fromJson(json.decode(str));

String dtoLoginParamsToJson(DtoLoginParams data) => json.encode(data.toJson());

class DtoLoginParams {
  String? email;
  String? password;

  DtoLoginParams({
    this.email,
    this.password,
  });

  factory DtoLoginParams.fromJson(Map<String, dynamic> json) => DtoLoginParams(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
