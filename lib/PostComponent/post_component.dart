import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Data/data.dart';
import '../Models/postModel.dart';

class PostComponent extends StatefulWidget {
  final Post post;
  final VoidCallback onEditPressed;
  final VoidCallback onDeletePressed;

  const PostComponent({
    required this.post,
    required this.onEditPressed,
    required this.onDeletePressed,
  });

  @override
  State<PostComponent> createState() => _PostComponentState();
}

class _PostComponentState extends State<PostComponent> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(widget.post.title),
            subtitle: Text(widget.post.body),
            trailing: Text('Likes: ${widget.post.likes}'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: widget.onEditPressed,
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: widget.onDeletePressed,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
