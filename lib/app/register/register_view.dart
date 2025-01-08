import 'dart:developer';

import 'package:blog_app/app/register/register_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterController controller = Get.put(RegisterController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade200, Colors.blue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              )),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: Get.height * 0.1),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'asseets/img/approved_15332443.gif',
                    width: 150,
                    height: 150,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "Username",
                      ),
                      onChanged: (value) {
                        controller.userName.value = value;
                      },
                    ),
                  ),
                  Obx(() {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Email",
                          errorText: controller.isEmailValid.value == true
                              ? null
                              : "format email belum sesuai",
                        ),
                        style: TextStyle(
                            color: controller.isEmailValid.value == true
                                ? Colors.black
                                : Colors.red),
                        onChanged: controller.validateEmail,
                      ),
                    );
                  }),
                  Obx(
                    () {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            TextField(
                              obscureText: !controller
                                  .isReveal.value, // Toggle visibility
                              decoration: const InputDecoration(
                                labelText: "Password",
                              ),
                              onChanged: (value) {
                                controller.password.value = value;
                              },
                            ),
                            GestureDetector(
                              onTap: () {
                                log("is reveal : ${controller.isReveal.value}");
                                controller.isReveal.value =
                                    !controller.isReveal.value;
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(
                                    8.0), // Prevents overlapping gestures
                                child: Icon(
                                  controller.isReveal.value
                                      ? CupertinoIcons.eye
                                      : CupertinoIcons.eye_slash,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.register();
                    },
                    child: Container(
                      width: 200,
                      height: 60,
                      // padding: EdgeInsets.symmetric(horizontal: 15),
                      margin: const EdgeInsets.only(bottom: 10, top: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [Colors.blue.shade300, Colors.blue],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
