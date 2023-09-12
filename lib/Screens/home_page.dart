import 'package:flutter/material.dart';

import '../Models/postModel.dart';
import '../PostComponent/post_component.dart';
import 'add_post.dart';
import 'edit_post.dart';
import 'post_details.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> posts1 = posts;
  void deletePost(BuildContext context, int index) {
    setState(() {
      posts1.removeAt(index);
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Blog Posts",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFF90D8F9),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _addAction(context);
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              _searchAction(context);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: posts1.length,
        itemBuilder: (context, index) {
          final post = posts1[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PostDetails(post: post)),
              );
            },
            child: PostComponent(
              post: post,
              onDeletePressed: () {
                _showDeleteConfirmationDialog(context, index);
              },
              onEditPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditScreen(post: post)),
                ).then((value) {
                  if (value == "back_from_edit") {
                    setState(() {});
                  }
                });
                ;
              },
            ),
          );
        },
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Post'),
          content: Text('Are you sure you want to delete this post?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                deletePost(context, index);
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _addAction(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddScreen()),
    ).then((value) {
      if (value == "back") {
        setState(() {});
      }
    });
  }

  void _searchAction(BuildContext context) async {
    final result = await showSearch<String>(
      context: context,
      delegate: PostSearchDelegate(),
    );
    if (result == "back") {
      setState(() {});
    }
  }
}

class PostSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, "back");
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredPosts = posts.where((post) {
      print(query);
      return post.title.toLowerCase().contains(query.toLowerCase());
    }).toList();
    return Scaffold(
      body: ListView.builder(
        itemCount: filteredPosts.length,
        itemBuilder: (context, index) {
          final post = filteredPosts[index];
          return GestureDetector(
            onTap: () {
              // Navigator.push(              //   context,
//   MaterialPageRoute(              //       builder: (context) => PostDetails(post: post)),
              // );
            },
            child: PostComponent(
              post: post,
              onDeletePressed: () {},
              onEditPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditScreen(post: post)),
                ).then((value) {
                  if (value == "back_from_edit") {
                    // setState(() {});
                  }
                });
                ;
              },
            ),
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
