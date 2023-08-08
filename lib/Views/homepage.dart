import 'package:flutter/material.dart';
import 'Widgets/cardmenuaddactivity.dart';
import 'Widgets/cardmenubig.dart';
import 'Widgets/cardmenusmall.dart';
import 'Widgets/foryou.dart';
import 'Widgets/searchbar.dart';

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
                      CardMenuSmall(Icons.star_rounded),
                      CardMenuSmall(Icons.person_rounded),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CardMenuBig(Icons.share_location),
                      CardMenuBig(Icons.connect_without_contact),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CardMenuSmall(Icons.people),
                      CardMenuSmall(Icons.access_time_filled),
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