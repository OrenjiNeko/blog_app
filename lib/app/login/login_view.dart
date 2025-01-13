import 'package:blog_app/app/login/login_controller.dart';
import 'package:blog_app/app/register/register_view.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'asseets/img/login_17905767.gif',
                width: 150,
                height: 150,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email",
                  ),
                  onChanged: (value) {
                    controller.email.value = value;
                  },
                ),
              ),
              Obx(
                () {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: TextField(
                      onChanged: (value) {
                        controller.password.value = value;
                      },
                      obscureText: !controller.isObsecure.value,
                      decoration: const InputDecoration(
                        labelText: "Password",
                      ),
                    ),
                  );
                },
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    Obx(
                      () {
                        return Checkbox(
                          value: controller.isObsecure.value,
                          onChanged: (value) {
                            controller.isObsecure.value = value!;
                          },
                        );
                      },
                    ),
                    const Text("Perlihatkan Password")
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.login();
                },
                child: Container(
                  width: 200,
                  height: 60,
                  // padding: EdgeInsets.symmetric(horizontal: 15),
                  margin: const EdgeInsets.only(bottom: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [Colors.green.shade300, Colors.green],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const RegisterView());
                },
                child: const Text(
                  "Register",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
