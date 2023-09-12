import 'dart:convert';

import '../Data/data.dart';

class Post {
  int id;
  String title;
  String body;
  int likes;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.likes,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      likes: json['likes'],
    );
  }

  static void add(Post ob) {}
}


List<Post> posts= List<Post>.from(postsData['posts'].map((postMap) {
  return Post(
    id: postMap['id'],
    title: postMap['title'],
    body: postMap['body'],
    likes: postMap['likes'],
  );
}));