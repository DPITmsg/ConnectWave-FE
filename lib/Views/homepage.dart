import 'package:flutter/material.dart';
import 'package:my_project/Views/Classes/Trending.dart';
import 'package:my_project/Views/Styles/Colors.dart';
import 'Widgets/cardmenusmall.dart';
import 'Widgets/cardmenuaddactivity.dart';
import 'add_activity_page.dart';
import 'profilepage.dart';
import 'Widgets/foryou.dart';
import 'Widgets/cardmenubig.dart';
import 'Widgets/test.dart';
import 'package:my_project/Views/activityhistory.dart';
import 'friends_list_page.dart';
import 'trending_page.dart';
import 'search_activity_map.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    var appBarHeight = AppBar().preferredSize.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(preferredSize: const Size.fromHeight(0), child: AppBar(elevation: 0, backgroundColor: const Color(0x44000000),),),
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
                Expanded(flex: 10, child: Text('ConnectWave', style: TextStyle(color: Color_Blue, fontSize: 48, fontWeight: FontWeight.bold),)),
                Expanded(flex: 1, child: Icon(Icons.settings)),
              ],
            ),
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
                      CardMenuSmall(Icons.star_rounded, const trending_page()),
                      CardMenuSmall(Icons.person_rounded, ProfilePage()),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CardMenuBig(Icons.share_location, SearchActivityMap()),
                      CardMenuBig(Icons.connect_without_contact, Test()),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CardMenuSmall(Icons.people, const friends_list_page()),
                      CardMenuSmall(Icons.access_time_filled, ActivityHistoryPage()),
                    ],
                  ),
                ),
                const Expanded(flex:1,child: CardMenuAddActivity(add_activity_page())),
                const InkWell(child: ForYou(Test())),
              ],
            ),
          )
        ],
      ),
    );
  }
}