import 'package:blog_app/app/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const ListTile(
                title: Text("Nama"),
                subtitle: Text("John Doe"),
              ),
              const ListTile(
                title: Text("Email"),
                subtitle: Text("john_doe17@example.com"),
              ),
              GestureDetector(
                onTap: () {
                  Get.off(() => const LoginView());
                },
                child: Container(
                  width: 200,
                  height: 60,
                  // padding: EdgeInsets.symmetric(horizontal: 15),
                  margin: const EdgeInsets.only(bottom: 10, top: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [Colors.red.shade300, Colors.red],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.logout, color: Colors.white)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
