import 'package:flutter/material.dart';
import 'package:my_project/Views/Styles/Colors.dart';
import 'package:my_project/Views/Styles/StyleText.dart';
import 'package:my_project/Views/Widgets/WidgetSmallButton.dart';

import '../Styles/Shadows.dart';

class WidgetBoxFriend extends StatelessWidget {
  final String text;

  const WidgetBoxFriend(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,0,0,10),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color_Blue, Color_Light_Blue]),
          borderRadius: BorderRadius.circular(25.0),
          border: Border.all(color: Color_Dark_Gray),
          boxShadow: [Shadow_Widget_Box],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/yoda.pfp.jpg'),
                radius: 30,
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Container(
                      child: Text(this.text, style: Text_Widget_FriendName)),
                ),
              ),
              Expanded(
                flex: 1,
                child: WidgetSmallButton(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          'Friends',
                          style: Text_Widget_SmallButton_Gray
                      ),
                      Expanded(child: Icon(Icons.check, color: Color_Gray))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
