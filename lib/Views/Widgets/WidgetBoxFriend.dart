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
    return Column(
      children: [
        Container(
          height: 80,
          width: 360,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color_Blue, Color_Light_Blue]
            ),
            borderRadius: BorderRadius.circular(25.0),
            border: Border.all(color: Color_Dark_Gray),
            boxShadow: [
              Shadow_Widget_Box
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/yoda.pfp.jpg'),
                  radius: 25.0,
                ),
                SizedBox(width: 15),
                Container(
                  width: 170,
                  child: Text(
                    this.text,
                    style: TextStyle(
                      color: Color_White,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                WidgetSmallButton(
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Friends',
                          style: Text_Widget_SmallButton_Gray
                        ),
                        Icon(Icons.check, color: Color_Gray, size: 20,)
                      ],
                    ),
                  )
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }
}