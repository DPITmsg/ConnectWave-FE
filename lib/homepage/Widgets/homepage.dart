import 'package:flutter/material.dart';
import 'package:my_project/homepage/Widgets/cardmenuaddactivity.dart';
import 'package:my_project/homepage/Widgets/cardmenubig.dart';
import 'package:my_project/profilepage/Widgets/profilepage.dart';
import 'cardmenusmall.dart';
import 'foryou.dart';
import 'searchbar.dart';
import 'test.dart';

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
              Expanded(flex: 8, child: SearchBarMenu()),
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
                      CardMenuSmall(Icons.star_rounded, Test()),
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
                      CardMenuSmall(Icons.people, Test()),
                      CardMenuSmall(Icons.access_time_filled, Test()),
                    ],
                  ),
                ),
                Expanded(flex:1,child: CardMenuAddActivity()),
                ForYou(),
              ],
            ),
          )
        ],
      ),
    );
  }
}