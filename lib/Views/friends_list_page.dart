import 'package:flutter/material.dart';
import 'package:my_project/Views/Styles/Colors.dart';
import 'package:my_project/Views/Styles/StyleText.dart';
import 'package:my_project/Views/Widgets/WidgetButtons.dart';

import 'Widgets/WidgetBoxFriend.dart';
import 'Widgets/WidgetSmallButton.dart';
import 'find_friends.dart';

List<String> friends_list = [
  'Darius Command',
  'Vlad Popes',
  'Bianca Danilov',
  'Alex Dudes cu',
  'Rpa Tudor',
  'Vld Darius',
  'a',
  'b',
  'c',
  'd'
];

class friends_list_page extends StatelessWidget {
  const friends_list_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('lib/Views/Styles/Backgrounds/Background_1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 30, 25, 10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: InkWell(
                          child: const SizedBox(
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Color_Dark_Gray,
                              size: 35,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Text(
                          'Friends list',
                          style: Text_Title_Top_FriendsList,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 12,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child: SingleChildScrollView(
                        child: Column(
                          children: friends_list.map((element) {
                            return WidgetBoxFriend(
                              element,
                              WidgetSmallButton(
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Friends',
                                        style: Text_Widget_SmallButton_Gray),
                                    const Expanded(
                                        child: Icon(
                                      Icons.check,
                                      color: Color_Gray,
                                      size: 20,
                                    ))
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const find_friends()));
                            },
                            child: WidgetButton(
                              Center(
                                child: Text("Find more",
                                    style: Text_Widget_Buttons_Blue),
                              ),
                              Color_Dark_Gray,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: WidgetButton(
                            Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Share',
                                      style: Text_Widget_Buttons_Blue),
                                  const Icon(Icons.share,
                                      color: Color_Light_Blue)
                                ],
                              ),
                            ),
                            Color_Dark_Gray,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
