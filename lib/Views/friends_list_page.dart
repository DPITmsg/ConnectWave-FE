import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_project/Service/friend_list_service.dart';
import 'package:my_project/Views/Styles/Colors.dart';
import 'package:my_project/Views/Styles/StyleText.dart';
import 'package:my_project/Views/Widgets/WidgetButtons.dart';
import 'package:my_project/Views/friend_request_page.dart';

import 'Classes/Friend.dart';
import 'Widgets/WidgetBoxFriend.dart';
import 'Widgets/WidgetSmallButton.dart';

import 'find_friends.dart';

class friends_list_page extends StatefulWidget {
  final List<Friend> friends_list;

  const friends_list_page(this.friends_list, {super.key});

  @override
  State<friends_list_page> createState() => _friends_list_pageState();
}

class _friends_list_pageState extends State<friends_list_page> {
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
                        child: widget.friends_list.isNotEmpty
                            ? Column(
                                children: widget.friends_list.map((user) {
                                  return WidgetBoxFriend(
                                    user.name,
                                    user.pfp,
                                    InkWell(
                                        onTap: () async {
                                          final response =
                                              await removeFriend(
                                              user.name);
                                          if(response.body == 'true'){
                                            widget.friends_list.remove(user);
                                            setState(() {});
                                          }
                                      },
                                      child: WidgetSmallButton(
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text('Friends',
                                                style:
                                                    Text_Widget_SmallButton_Gray),
                                            const Expanded(
                                                child: Icon(
                                              Icons.check,
                                              color: Color_Gray,
                                              size: 20,
                                            ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              )
                            : const Text('You have no friends'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              final response = await getUserList();
                              List<Friend> user_list =
                                  (jsonDecode(response.body) as List)
                                      .map((e) => Friend.fromJson(e))
                                      .toList();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      find_friends(user_list)));
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
                          child: InkWell(
                            onTap: () async {
                              final response = await getRequestList();
                              List<Friend> request_list =
                                  (jsonDecode(response.body) as List)
                                      .map((e) => Friend.fromJson(e))
                                      .toList();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      friend_request_page(request_list)));
                            },
                            child: WidgetButton(
                              Center(
                                child: Text('Requests',
                                    style: Text_Widget_Buttons_Blue),
                              ),
                              Color_Dark_Gray,
                            ),
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
