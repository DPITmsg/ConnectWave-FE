import 'package:flutter/material.dart';
import 'package:my_project/Views/Classes/Friend.dart';
import 'package:my_project/Views/Styles/Colors.dart';
import 'package:my_project/Views/activityhistory.dart';
import '../darius_mock_models/remote_service_singular_object.dart';
import 'Widgets/awesomegradient.dart';
import 'Widgets/stars.dart';
import 'Widgets/cardsprofilestats.dart';
import 'Widgets/interestsortags.dart';
import 'Classes/User.dart';
import 'Widgets/avatarcontainer.dart';
import 'Widgets/test.dart';
import 'friends_list_page.dart';
import 'Classes/activitydetails.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  AssetImage profilePic = AssetImage('assets/profilepic2.png');

  List<Friend> friends = [
    Friend(name: "Darius", pfp: "yeah")
  ];

  User? user;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    try {
      final userData = await fetchUserData();
      user = User.fromJson(userData);

      setState(() {
        isLoaded = true;
      });
    } catch (error) {
      print('Error loading data: $error');
    }
  }




  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: null,
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(child: CircularProgressIndicator(),),
        child: Container(
          height: screenHeight,
          decoration: BoxDecoration(color: Color(0xffc9cfcf)),
          child: isLoaded
            ? SingleChildScrollView(
            child: Stack(
              children: [
                Center(child: Icon(Icons.arrow_back_rounded)),
                AwesomeGradient(),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, screenHeight * 0.2 - 72, 0, 0),
                  child: Center(
                    child: Column(
                      children: [
                        AvatarContainer(profilePic),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 8),
                          child: Text(
                            user!.name,
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Color_Dark_Gray,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                          child: Stars(user!.rating),
                        ),
                        Text('Age: ${user!.age.toString()}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color_Dark_Gray),),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CardProfile(
                                user!.activicompleted.toString(),
                                'Activities Completed',
                                ActivityHistoryPage(),
                              ),
                              CardProfile(
                                user!.friends.toString(),
                                'Friends',
                                  friends_list_page(friends),
                              ),
                              CardProfile(
                                user!.favcategory,
                                'Favorite Category',
                                Test(),
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
                                Text(user!.about),
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
                          child: IntOrTags(user!.interests),
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
                          child: IntOrTags(user!.tags),
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
          ): const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
