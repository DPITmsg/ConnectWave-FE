import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_project/Service/activity_service.dart';
import 'package:my_project/Views/Classes/Friend.dart';
import 'package:my_project/Views/Styles/Colors.dart';
import 'package:my_project/Views/ongoing_activities.dart';
import 'package:my_project/Views/search_activity_map.dart';
import 'package:my_project/darius_mock_models/remote_service_list_objects.dart';

import '../Service/friend_list_service.dart';
import '../darius_mock_models/remote_service_singular_object.dart';
import 'Classes/Trending.dart';
import 'Classes/User.dart';
import 'Classes/activitydetails.dart';
import 'Widgets/cardmenuaddactivity.dart';
import 'Widgets/cardmenubig.dart';
import 'Widgets/cardmenusmall.dart';
import 'Widgets/foryou.dart';
import 'Widgets/loadingscreennopop.dart';
import 'add_activity_page.dart';
import 'friends_list_page.dart';
import 'profilepage.dart';
import 'search_activity_online.dart';
import 'trending_page.dart';

class HomePage extends StatefulWidget {
  User? user;

  HomePage({Key? key, required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isLoaded = true;

  /*
  bool isLoaded = false;
  User? user;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    try {
      final userData = await fetchUserData('1278403');
      user = User.fromJson(userData);

      setState(() {
        isLoaded = true;
      });
    } catch (error) {
      print('Error loading data: $error');
    }
  }

   */

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    var appBarHeight = AppBar().preferredSize.height;

    return isLoaded ? Scaffold(
      extendBodyBehindAppBar: true,
      appBar: null,
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
                Text(
                  'ConnectWave',
                  style: TextStyle(
                      color: Color_Blue,
                      fontSize: 38,
                      fontWeight: FontWeight.bold),
                ),
                Image(
                  image: AssetImage('assets/logo_nobg.png'),
                  width: 80,
                  height: 80,
                ),
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
                      CardMenuSmall(
                          Icons.person_rounded, ProfilePage(user: widget.user!)),
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
                          child: CardMenuBig(
                              Icons.share_location,
                              SearchActivityMap(
                                  locationTarget: LatLng(46.7712, 23.6323),
                                  zoomLevel: 14,
                                  user: widget.user!
                              ))),
                      InkWell(
                          onTap: () {},
                          child: CardMenuBig(
                              Icons.connect_without_contact,
                              SearchActivityOnlinePage(user: widget.user!,))),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

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
                          Icons.access_time_filled,
                          OngoingActivities(user: widget.user!)),
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: CardMenuAddActivity(
                        add_activity_page(user: widget.user!))),
                const InkWell(child: ForYou()),
              ],
            ),
          )
        ],
      ),
    ): const LoadingScreenPageNoPop();
  }
}