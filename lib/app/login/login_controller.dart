import 'dart:developer';

import 'package:blog_app/app/landing/landing_view.dart';
import 'package:blog_app/dto/dto_login_params.dart';
import 'package:blog_app/service/login_service.dart';
import 'package:get/get.dart';

import 'package:blog_app/utils.dart';

class LoginController extends GetxController {
  var isObsecure = false.obs;
  var email = "".obs;
  var password = "".obs;

  Future<void> login() async {
    if (email.value == "" || email.value == null) {
      getSnackbarInfo("Silahkan Isi Email Terlebih Dahulu");
      return;
    }
    if (password.value == "" || password.value == null) {
      getSnackbarInfo("Silahkan Isi Password Terlebih Dahulu");
      return;
    }
    var params = DtoLoginParams(
      email: email.value,
      password: password.value,
    );
    var response = await LoginService().login(params);

    if (response.error != null) {
      getSnackbarError(response.error!);
      return;
    }
    if (response.error == null) {
      email.value = "";
      password.value = "";
      Get.off(() => const LandingView());
    }
  }
}
