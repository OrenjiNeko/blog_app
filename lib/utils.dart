import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

String? apiBaseUrl = dotenv.env['API_URL'];

void getSnackbarSuccess(String message) {
  Get.snackbar(
    'Success',
    colorText: Colors.white,
    message,
    backgroundColor: Colors.green,
    icon: const Icon(
      Icons.done,
      color: Colors.white,
    ),
  );
}

void getSnackbarInfo(String message) {
  Get.snackbar(
    'Info',
    colorText: Colors.white,
    message,
    backgroundColor: Colors.blue,
    icon: const Icon(
      Icons.info,
      color: Colors.white,
    ),
  );
}

void getSnackbarError(String message) {
  Get.snackbar('Error', message,
      colorText: Colors.white,
      backgroundColor: Colors.red,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ));
}
