import 'package:flutter/material.dart';

import 'home_page.dart';


class Searchwedgit extends StatefulWidget {
  const Searchwedgit({super.key});

  @override
  State<Searchwedgit> createState() => _Searchwedgit();
}

class _Searchwedgit extends State<Searchwedgit> {
  bool isFound = false;
  TextEditingController titleController = TextEditingController();
  
  get postObject => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Page"),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: 250,
                child: TextField(
                  onSubmitted: (value) {
                    titleController.text == value;
                    isFound = true;
                    setState(() {});
                  },
                  controller: titleController,
                  decoration: InputDecoration(
                      hintText: "Enter title",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                              color: Colors.amber, width: 44)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                              color: Colors.amber, width: 44))),
                ),
              ),
            ),
            isFound
                ? Column(
                    children: resultcard(),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  resultcard() {
    List<Widget> results = [];
    for (var element in postObject!) {
      if (element.title.contains(titleController.text)) {
        results.add(HomePage(
        ));
      }
    }
    return results;
  }
}