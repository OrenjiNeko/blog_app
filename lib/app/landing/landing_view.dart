import 'package:blog_app/app/landing/landing_controller.dart';
import 'package:blog_app/app/posts/posts_view.dart';
import 'package:blog_app/app/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> listWidget = [
      const PostsView(),
      const ProfileView(),
    ];
    var controller = Get.put(LandingController());

    return Obx(() {
      return Scaffold(
        body: listWidget[controller.tabIndex.value],
        bottomNavigationBar: Container(
          height: context.height * 0.08,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.green, blurRadius: 10.0)],
          ),
          child: BottomNavigationBar(
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: false,
            currentIndex: controller.tabIndex.value,
            onTap: (value) {
              controller.tabIndex.value = value;
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.abc), label: "Post"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
            ],
          ),
        ),
      );
    });
  }
}
