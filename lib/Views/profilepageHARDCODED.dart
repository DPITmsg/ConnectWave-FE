import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_project/Views/Styles/Colors.dart';
import 'package:my_project/Views/Widgets/loadingscreennopop.dart';
import 'package:my_project/Views/activityhistory.dart';
import 'package:my_project/Views/createdActivitiesHARDCODED.dart';

import '../Service/friend_list_service.dart';
import '../darius_mock_models/remote_service_list_objects.dart';
import 'Classes/ActivityHistory.dart';
import 'Classes/Friend.dart';
import 'Classes/User.dart';
import 'Classes/activitydetails.dart';
import 'Widgets/avatarcontainer.dart';
import 'Widgets/awesomegradient.dart';
import 'Widgets/cardsprofilestats.dart';
import 'Widgets/interestsortags.dart';
import 'Widgets/stars.dart';
import 'activities_created_page.dart';
import 'friends_list_page.dart';

class ProfilePageHardCoded extends StatefulWidget {
  User? user;
  User? actualUser;

  ProfilePageHardCoded({Key? key, required this.user}) : super(key: key);

  @override
  _ProfilePageStateHardCoded createState() => _ProfilePageStateHardCoded();
}

class _ProfilePageStateHardCoded extends State<ProfilePageHardCoded> {

  List<ActivityDetails> activitiesCreated = [];
  List<ActivityHistory> activitiesCompleted = [];
  bool isLoaded = false;
  List<Friend> friends = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    final activityData = await fetchEventData();
    User? tempUser = await getUserByUsername(widget.user!.username);

    List<String>? listUsernames = await getFriendList(widget.user!.username);
    List<Friend> friendsList = [];
    for (var i = 0; i < listUsernames!.length; i++){
      User? user = await getUserByUsername(listUsernames[i]);

      Friend friend = Friend(name: user!.username, pfp: user.pfp);
      friendsList.add(friend);
    }

    setState(() {
      activitiesCreated = activityFromJson(json.encode(activityData)).where((activity) => widget.user!.activities_created.contains(activity.id)).toList();
      activitiesCompleted = activityHistoryFromJson(json.encode(activityData)).where((activity) => widget.user!.activities_completed.contains(activity.id)).toList();
      widget.user = tempUser;
      friends = friendsList;
      isLoaded = true;
    });
  }

  AssetImage profilePic = AssetImage('assets/profilepic2.png');


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return isLoaded ? Scaffold(
      appBar: null,
      body: Container(
          height: screenHeight,
          decoration: BoxDecoration(color: Color(0xffc9cfcf)),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Center(child: Icon(Icons.arrow_back_rounded)),
                AwesomeGradient(),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, screenHeight * 0.2 - 72, 0, 0),
                  child: Center(
                    child: Column(
                      children: [
                        AvatarContainer(widget.user!.pfp),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Text(
                                  widget.user!.name,
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Color_Dark_Gray,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 8), child: Text(widget.user!.username),),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                          child: Stars(widget.user!.rating),
                        ),
                        Text('Age: ${widget.user!.age.toString()}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color_Dark_Gray),),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CardProfile(
                                widget.user!.activities_completed.length.toString(),
                                'Activities Completed',
                                ActivityHistoryPage(activities: activitiesCompleted, user: widget.user!, isUser: false,),
                              ),
                              CardProfile(
                                friends.length.toString(),
                                'Friends',
                                friends_list_page(friends, widget.user!),
                              ),
                              CardProfile(
                                widget.user!.activities_created.length.toString(),
                                'Activities Created',
                                CreatedActivitiesHardCoded(userObserved: widget.user!),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'About',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(widget.user!.about),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Interests",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: IntOrTags(widget.user!.interests),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Tags",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: IntOrTags(widget.user!.tags),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 50, 0, 0),
                  child: InkWell(
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Image.asset('assets/left-arrow.png'),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(screenWidth - 50, 50, 0, 0),
                  child: InkWell(
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Image.asset('assets/instagram.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(screenWidth - 100, 50, 0, 0),
                  child: InkWell(
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Image.asset('assets/facebook.png'),
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    ): LoadingScreenPageNoPop();
  }
}

