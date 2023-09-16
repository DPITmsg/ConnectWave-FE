import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_project/Service/activity_service.dart';
import 'package:my_project/Views/Classes/Friend.dart';
import 'package:my_project/Views/Styles/Colors.dart';
import 'package:my_project/Views/activityhistory.dart';
import 'package:my_project/Views/ongoing_activities.dart';
import 'package:my_project/Views/search_activity_map.dart';

import '../Service/friend_list_service.dart';
import 'Classes/Trending.dart';
import 'Widgets/cardmenuaddactivity.dart';
import 'Widgets/cardmenubig.dart';
import 'Widgets/cardmenusmall.dart';
import 'Widgets/foryou.dart';
import 'Widgets/test.dart';
import 'add_activity_page.dart';
import 'friends_list_page.dart';
import 'profilepage.dart';
import 'trending_page.dart';
import 'search_activity_online.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    var appBarHeight = AppBar().preferredSize.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          elevation: 0,
          backgroundColor: const Color(0x44000000),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, appBarHeight, 0, 0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    flex: 10,
                    child: Text(
                      'ConnectWave',
                      style: TextStyle(
                          color: Color_Blue,
                          fontSize: 48,
                          fontWeight: FontWeight.bold),
                    )),
                Expanded(flex: 1, child: Icon(Icons.settings)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, screenHeight * 0.2, 10, 0),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      /*CardMenuSmall(Icons.star_rounded, const trending_page()),*/
                      ElevatedButton(
                        onPressed: () async {
                          final response = await getTrendingList();
                          List<Trending> trending_list =
                              (jsonDecode(response.body) as List)
                                  .map((e) => Trending.fromJson(e))
                                  .toList();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  trending_page(trending_list)));
                        },
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.black.withOpacity(0.4),
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(24),
                          backgroundColor: const Color(0xff45bac4),
                        ),
                        child: const Icon(
                          Icons.star_rounded,
                          size: 60,
                          color: Color(0xff1a1a1a),
                        ),
                      ),
                      CardMenuSmall(Icons.person_rounded, ProfilePage()),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                          onTap: () {},
                          child: CardMenuBig(Icons.share_location, SearchActivityMap())),
                      InkWell(
                          onTap: () {},
                          child: CardMenuBig(Icons.connect_without_contact, SearchActivityOnlinePage())),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      /*CardMenuSmall(Icons.people, const friends_list_page()),*/
                      ElevatedButton(
                        onPressed: () async {
                          final response = await getFriendList();
                          List<Friend> friends_list =
                              (jsonDecode(response.body) as List)
                                  .map((e) => Friend.fromJson(e))
                                  .toList();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  friends_list_page(friends_list)));
                        },
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.black.withOpacity(0.4),
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(24),
                          backgroundColor: const Color(0xff45bac4),
                        ),
                        child: const Icon(
                          Icons.people,
                          size: 60,
                          color: Color(0xff1a1a1a),
                        ),
                      ),
                      CardMenuSmall(
                          Icons.access_time_filled, OngoingActivities()),
                    ],
                  ),
                ),
                const Expanded(
                    flex: 1, child: CardMenuAddActivity(add_activity_page())),
                const InkWell(child: ForYou(null)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
