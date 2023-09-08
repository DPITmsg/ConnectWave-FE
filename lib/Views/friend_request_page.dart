import 'package:flutter/material.dart';
import 'package:my_project/Service/friend_list_service.dart';

import 'Classes/Friend.dart';
import 'Styles/Colors.dart';
import 'Styles/StyleText.dart';
import 'Widgets/WidgetBoxFriend.dart';

class friend_request_page extends StatefulWidget {
  final List<Friend> request_list;

  const friend_request_page(this.request_list, {super.key});

  @override
  State<friend_request_page> createState() => _friend_request_pageState();
}

class _friend_request_pageState extends State<friend_request_page> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'lib/Views/Styles/Backgrounds/Background_2.png'),
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
                  mainAxisAlignment: MainAxisAlignment.start,
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
                            'Friend requests',
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
                          child: widget.request_list.isNotEmpty
                              ? Column(
                                  children: widget.request_list.map((user) {
                                    return WidgetBoxFriend(
                                      user.name,
                                      user.pfp,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          InkWell(
                                              onTap: () async {
                                                final response =
                                                    await responseFriendRequest(
                                                        "-1");
                                                if(response.body == 'true'){
                                                  widget.request_list
                                                      .remove(user);
                                                  setState(() {});
                                                }
                                              },
                                              child: const Icon(
                                                Icons.clear,
                                                color: Colors.red,
                                              )),
                                          InkWell(
                                              onTap: () async {
                                                final response =
                                                await responseFriendRequest(
                                                    user.name);
                                                if(response.body == 'true'){
                                                  widget.request_list
                                                      .remove(user);
                                                  setState(() {});
                                                }
                                              },
                                              child: const Icon(Icons.check,
                                                  color: Colors.green))
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                )
                              : const Text('You have no more requests'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
