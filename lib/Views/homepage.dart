import 'package:flutter/material.dart';
import 'package:my_project/Views/activityhistory.dart';
import 'package:my_project/Views/add_activity_page.dart';
import 'package:my_project/Views/friends_list_page.dart';
import 'package:my_project/Views/trending_page.dart';

import 'Widgets/cardmenuaddactivity.dart';
import 'Widgets/cardmenubig.dart';
import 'Widgets/cardmenusmall.dart';
import 'Widgets/foryou.dart';
import 'profilepage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: null,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(flex: 8, child: Text('ConnectWave', style: TextStyle(color: Colors.blue),)),
              Expanded(flex: 1, child: Icon(Icons.settings)),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, screenHeight*0.2, 10, 0),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CardMenuSmall(Icons.star_rounded, trending_page()),
                      CardMenuSmall(Icons.person_rounded, ProfilePage()),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(onTap: () {}, child: CardMenuBig(Icons.share_location)),
                      InkWell(onTap: () {}, child: CardMenuBig(Icons.connect_without_contact)),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CardMenuSmall(Icons.people, friends_list_page()),
                      CardMenuSmall(Icons.access_time_filled, ActivityHistoryPage()),
                    ],
                  ),
                ),
                Expanded(flex:1,child: CardMenuAddActivity(add_activity_page())),
                ForYou(),
              ],
            ),
          )
        ],
      ),
    );
  }
}