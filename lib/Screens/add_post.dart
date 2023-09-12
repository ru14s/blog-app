import 'package:flutter/material.dart';
import '../Components/textFieldComponent.dart';
import '../Models/postModel.dart';
import '../main.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key});

  final TextEditingController? controllerPost = TextEditingController();
  final TextEditingController? controllerPost1 = TextEditingController();
  final TextEditingController? controllerPost2 = TextEditingController();
  final TextEditingController? controllerPost3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF90D8F9),
        actions: [
          IconButton(
              onPressed: () {
                final ob = Post(
                    id: int.parse(controllerPost3!.text),
                    title: controllerPost!.text,
                    body: controllerPost1!.text,
                    likes: int.parse(controllerPost2!.text));
                posts.add(ob);
                Navigator.pop(context, "back");
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                CustomTextField(
                  controller: controllerPost3,
                  hintText: "Post ID",
                ),
                CustomTextField(
                  controller: controllerPost,
                  hintText: "Post title",
                ),
                CustomTextField(
                  controller: controllerPost1,
                  hintText: "Post Body",
                ),
                CustomTextField(
                  controller: controllerPost2,
                  hintText: "Post Likes",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
