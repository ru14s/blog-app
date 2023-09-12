import 'package:flutter/material.dart';
import '../Models/postModel.dart';

class EditScreen extends StatelessWidget {
  final TextEditingController controllerPost;
  final TextEditingController controllerPost1;
  final TextEditingController controllerPost2;
  final TextEditingController controllerPost3;
  final Post post;

  EditScreen({Key? key, required this.post})
      : controllerPost = TextEditingController(text: post.title),
        controllerPost1 = TextEditingController(text: post.body),
        controllerPost2 = TextEditingController(text: post.likes.toString()),
        controllerPost3 = TextEditingController(text: post.id.toString()),
        super(key: key);
  void updatePost(int postId, Post updatedPost) {
    int index = posts.indexWhere((post) => post.id == postId);
    if (index != -1) {
      posts[index] = updatedPost;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade200,
        actions: [
          IconButton(
            onPressed: () {
              final updatedPost = Post(
                id: int.parse(controllerPost3.text),
                title: controllerPost.text,
                body: controllerPost1.text,
                likes: int.parse(controllerPost2.text),
              );
              updatePost(post.id, updatedPost);

              Navigator.pop(context, "back_from_edit");
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controllerPost,
                    decoration: const InputDecoration(
                      hintText: "Post Title",
                      enabledBorder: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controllerPost1,
                    decoration: const InputDecoration(
                      hintText: "Post Body",
                      enabledBorder: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controllerPost2,
                    decoration: const InputDecoration(
                      hintText: "Post likes",
                      enabledBorder: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
