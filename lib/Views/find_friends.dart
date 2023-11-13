import 'package:flutter/material.dart';
import 'package:my_project/Service/friend_list_service.dart';

import 'Classes/Friend.dart';
import 'Classes/User.dart';
import 'Styles/Colors.dart';
import 'Styles/StyleText.dart';
import 'Widgets/WidgetBoxFriend.dart';
import 'Widgets/WidgetSmallButton.dart';

List<Friend> user_list = [];

class find_friends extends StatefulWidget {
  final List<Friend> user_list_2;
  final User currentUser;

  const find_friends(this.user_list_2,this.currentUser ,{super.key});

  @override
  State<find_friends> createState() => _find_friendsState();
}

class _find_friendsState extends State<find_friends> {
  TextEditingController input_search = TextEditingController();

  List<Friend> get get_user_list => widget.user_list_2;

  void filterSearchResults(String query) {
    setState(() {
      user_list = get_user_list
          .where(
              (user) => user.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

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
                      'lib/Views/Styles/Backgrounds/Background_3.png'),
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
                            'Find friends',
                            style: Text_Title_Top_FriendsList,
                          ),
                        ),
                      ],
                    ),
                    TextField(
                      onChanged: (value) {
                        filterSearchResults(value);
                      },
                      controller: input_search,
                      style: Text_FindFriends_Search_Black,
                      autocorrect: false,
                      decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: Text_FindFriends_Search_Black_Hint,
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color_Blue), // Custom border color
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              input_search.clear();
                            },
                            icon: const Icon(
                              Icons.clear,
                              color: Color_Blue,
                            ),
                          )),
                    ),
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: user_list.length,
                          itemBuilder: (context, index) {
                            return WidgetBoxFriend(
                              user_list[index].name,
                              user_list[index].pfp,
                              InkWell(
                                onTap: () async {
                                    await sendFriendRquest(user_list[index].name, widget.currentUser.username);
                                    setState(() {
                                      widget.user_list_2.remove(user_list[index]);
                                      user_list.remove(user_list[index]);
                                    });
                                },
                                child: WidgetSmallButton(
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text('Add',
                                            style:
                                                Text_Widget_SmallButton_Gray),
                                      ),
                                      const Expanded(
                                          child: Icon(
                                        Icons.add,
                                        color: Color_Gray,
                                        size: 20,
                                      ))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
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
