import 'package:my_project/Views/Styles/Backgrounds/Background_0.dart';
import 'package:my_project/Views/Styles/Colors.dart';
import 'package:my_project/Views/Styles/StyleText.dart';
import 'package:my_project/Views/Widgets/WidgetButtons.dart';

import 'Widgets/WidgetBoxFriend.dart';
import 'package:flutter/material.dart';
import 'Classes/User.dart';

User user = User(
    name: 'a',
    rating: 1,
    activicompleted: 1,
    friends: 1,
    favcategory: 's',
    about: 'a',
    interests: [
      'a'
    ],
    tags: [
      'a'
    ],
    friends_list: [
      'Darius Coman',
      'Vlad Popescu',
      'Bianca Danilov',
      'Alex Dudescu',
      'Rpa Tudor',
      'Vld Darius',
      'a',
      'b',
      'c',
      'd'
    ]);

class friends_list_page extends StatelessWidget {
  const friends_list_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Background_0(),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Friends list',
                      style: TextStyle(
                        color: Color_Dark_Gray,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    Icon(
                      Icons.search,
                      color: Color_Dark_Gray,
                      size: 40,
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 620,
                width: 400,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                      children: user.friends_list.map((element) {
                        return WidgetBoxFriend(element);
                      }).toList(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WidgetButton(
                      Center(
                        child: Text('Recommended',
                            style: Text_Widget_Buttons_White_Small),
                      ),
                      Color_Dark_Gray,
                    ),
                    WidgetButton(
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Share',
                                style: Text_Widget_Buttons_White_Small),
                            Icon(
                              Icons.share,
                              color: Color_White,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                      Color_Dark_Gray,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
