import 'package:flutter/material.dart';

import '../Data/data.dart';
import '../Models/postModel.dart';

class PostDetails extends StatelessWidget {
  final Post post;

  const PostDetails({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Post Details',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFF90D8F9),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(post.body),
          ],
        ),
      ),
    );
  }
}
