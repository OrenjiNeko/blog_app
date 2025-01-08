import 'dart:developer';

import 'package:blog_app/app/login/login_view.dart';
import 'package:blog_app/models/register_model.dart';
import 'package:blog_app/utils.dart';
import 'package:get/get.dart';

import '../../dto/dto_register_params.dart';
import '../../service/register_service.dart';

class RegisterController extends GetxController {
  RegisterModel? regiterModel;
  var isReveal = false.obs;
  var isEmailValid = true.obs;
  var userName = "".obs;
  var email = "".obs;
  var password = "".obs;

  Future<void> register() async {
    if (email.isEmpty || userName.isEmpty || password.isEmpty) {
      getSnackbarInfo("silahkan lengkapi form");
      return;
    }
    log("email : $email, username : $userName, password : $password");
    var params = DtoRegisterParams(
      username: userName.value,
      email: email.value,
      password: password.value,
    );
    var response = await RegisterService().register(params);
    regiterModel = RegisterModel(
      error: response.error,
      message: response.message,
    );
    log("response : $regiterModel");
    if (response.error != null) {
      getSnackbarError(response.message!);
      return;
    }
    if (response.error == null) {
      getSnackbarSuccess(response.message!);
      Get.off(() => const LoginView());
    }
  }

  void validateEmail(String value) {
    // Regex for email validation
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');

    isEmailValid.value = emailRegex.hasMatch(value);
    email.value = value;
  }
}
