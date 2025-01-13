import 'dart:convert';
import 'dart:developer';

import 'package:blog_app/dto/dto_login.dart';
import 'package:blog_app/dto/dto_login_params.dart';
import 'package:blog_app/utils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginService extends GetConnect {
  Future<DtoLogin> login(DtoLoginParams params) async {
    String uri = '$apiBaseUrl/login';
    try {
      Map data = {"email": params.email, "password": params.password};
      var body = json.encode(data);
      var response = await http.post(
        Uri.parse(uri),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      final jsonData = json.decode(response.body);
      return DtoLogin.fromJson(jsonData);
    } catch (e) {
      log("error : $e");
      getSnackbarError(e.toString());
      rethrow;
    }
  }
}
