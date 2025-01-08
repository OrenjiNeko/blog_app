import 'dart:convert';
import 'dart:developer';

import 'package:blog_app/dto/dto_register.dart';
import 'package:blog_app/dto/dto_register_params.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:blog_app/utils.dart';

class RegisterService extends GetConnect {
  Future<DtoRegister> register(DtoRegisterParams params) async {
    String uri = '$apiBaseUrl/signup';
    try {
      log("params : ${params.toJson()}");
      Map data = {
        "email": params.email,
        "username": params.username,
        "password": params.password
      };
      var body = json.encode(data);
      var response = await http.post(
        Uri.parse(uri),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      // var response = await post(uri, body);
      log("response : ${response.body}");
      final jsonData = json.decode(response.body);
      return DtoRegister.fromJson(jsonData);
    } catch (e) {
      log("error : $e");
      rethrow;
    }
  }
}
