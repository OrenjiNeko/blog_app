import 'package:flutter/material.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (context, index) {
        return Container(
          height: 150,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: index != 0
                ? const Border.symmetric(horizontal: BorderSide(width: 1))
                : null,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Cecep Sepakbor",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "ini merupakan lorem ipsum anjay gurinjaay awe awe, ini merupakan lorem ipsum anjay gurinjaay awe awe, ini merupakan lorem ipsum anjay gurinjaay awe awe, ini merupakan lorem ipsum anjay gurinjaay awe awe",
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }
}
