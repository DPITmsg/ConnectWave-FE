import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestFriends extends StatefulWidget {
  List<String> friendsUsernames;

  TestFriends({super.key, required this.friendsUsernames});

  @override
  State<TestFriends> createState() => _TestFriendsState();
}

class _TestFriendsState extends State<TestFriends> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            child: ListView.builder(
              itemCount: widget.friendsUsernames.length,
                itemBuilder: (context, index) => Text(widget.friendsUsernames[index]),
            ),
          ),
        ],
      ),
    );
  }
}
