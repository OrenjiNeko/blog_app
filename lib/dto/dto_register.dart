// To parse this JSON data, do
//
//     final dtoRegister = dtoRegisterFromJson(jsonString);

import 'dart:convert';

DtoRegister dtoRegisterFromJson(String str) =>
    DtoRegister.fromJson(json.decode(str));

String dtoRegisterToJson(DtoRegister data) => json.encode(data.toJson());

class DtoRegister {
  String? error;
  String? message;

  DtoRegister({
    this.error,
    this.message,
  });

  factory DtoRegister.fromJson(Map<String, dynamic> json) => DtoRegister(
        error: json["error"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
      };
}
