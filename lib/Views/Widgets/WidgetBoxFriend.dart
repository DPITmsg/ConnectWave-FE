import 'package:flutter/material.dart';
import 'package:my_project/Views/Styles/Colors.dart';
import 'package:my_project/Views/Styles/StyleText.dart';

import '../Styles/Shadows.dart';

class WidgetBoxFriend extends StatelessWidget {
  final String name;
  final String pfp;
  final Widget smallButton;

  const WidgetBoxFriend(this.name, this.pfp,this.smallButton, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,0,0,10),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color_Blue, Color_Light_Blue]),
          borderRadius: BorderRadius.circular(25.0),
          border: Border.all(color: Color_Dark_Gray),
          boxShadow: [Shadow_Widget_Box],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Row(
            children: [
               Stack(
                 children: [
                   Container(
                     width: 60,
                     height: 60,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(360),
                       color: Color_Gray
                     ),
                     child: Icon(Icons.person, color: Color_Blue,),
                   ),
                   CircleAvatar(
                    backgroundImage: NetworkImage(pfp),
                    backgroundColor: Colors.transparent,
                    radius: 30,
              ),
                 ],
               ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(name, style: Text_Widget_FriendName),
                ),
              ),
              Expanded(
                flex: 1,
                child: smallButton
              )
            ],
          ),
        ),
      ),
    );
  }
}
