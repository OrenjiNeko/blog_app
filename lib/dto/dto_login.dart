// To parse this JSON data, do
//
//     final dtoLogin = dtoLoginFromJson(jsonString);

import 'dart:convert';

DtoLogin dtoLoginFromJson(String str) => DtoLogin.fromJson(json.decode(str));

String dtoLoginToJson(DtoLogin data) => json.encode(data.toJson());

class DtoLogin {
  String? token;
  int? userId;
  String? error;

  DtoLogin({
    this.token,
    this.userId,
    this.error,
  });

  factory DtoLogin.fromJson(Map<String, dynamic> json) => DtoLogin(
        token: json["token"],
        userId: json["user_id"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user_id": userId,
        "error": error,
      };
}
