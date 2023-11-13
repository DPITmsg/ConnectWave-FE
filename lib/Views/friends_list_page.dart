import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_project/Service/friend_list_service.dart';
import 'package:my_project/Views/Styles/Colors.dart';
import 'package:my_project/Views/Styles/StyleText.dart';
import 'package:my_project/Views/Widgets/WidgetButtons.dart';
import 'package:my_project/Views/friend_request_page.dart';
import 'package:my_project/Views/tempFile.dart';

import 'Classes/Friend.dart';
import 'Classes/User.dart';
import 'Widgets/WidgetBoxFriend.dart';
import 'Widgets/WidgetSmallButton.dart';

import 'find_friends.dart';

class friends_list_page extends StatefulWidget {
  List<Friend> friends_list;
  final User user;

  friends_list_page(this.friends_list, this.user,{super.key});

  @override
  State<friends_list_page> createState() => _friends_list_pageState();
}

class _friends_list_pageState extends State<friends_list_page> {

  void updateFriendsList() async{

    List<String>? listUsernames = await getFriendList(widget.user.username);
    List<Friend> friends = [];

    for (var i = 0; i < listUsernames!.length; i++){
      User? user3 = await getUserByUsername(listUsernames[i]);

      Friend userAsFriend = Friend(name: user3!.username, pfp: user3.pfp);

      friends.add(userAsFriend);
    }
    print(friends.length);

    setState(() {
      widget.friends_list = friends;
    });
  }

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
                              final response = await getUserList(widget.user.username);
                              List<Friend> user_list = (jsonDecode(response.body) as List)
                                  .map((e) => Friend.fromJson(e))
                                  .toList();
                              user_list.removeWhere((friend) => friend.name == widget.user.username);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      find_friends(user_list,widget.user)));
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
                            List<String>? listUsernames = await getRequestList(widget.user!.username);

                            List<Friend> userRequests = [];
                            for (var i = 0; i < listUsernames!.length; i++){
                              User? user = await getUserByUsername(listUsernames[i]);

                              Friend friend = Friend(name: user!.username, pfp: user.pfp);
                              userRequests.add(friend);
                            }
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => friend_request_page(userRequests, widget.user, (){updateFriendsList();})));
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
