import 'dart:ffi';

import 'package:flutter/material.dart';
import 'Widgets/awesomegradient.dart';
import 'Widgets/stars.dart';
import 'Widgets/cardsprofilestats.dart';
import 'Widgets/interestsortags.dart';
import 'Classes/User.dart';
import 'Widgets/avatarcontainer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class ProfilePage extends StatelessWidget {
  User user_details = User(
      name: 'John Thomas',
      rating: 3.5,
      activicompleted: 8,
      friends: 0,
      favcategory: 'Sports',
      about: 'Hi, my name is John Thomas and I am 22. I live in Cluj Napoca but I was born on Mars. I am passionate about playing golf and gaming. I also won 3 marathons. I like watching movies and my favorite show of all time is Game of Thrones. '
          'I also enjoy playing games, I would consider Assassins Creed to be my favorite',
      interests: ['sports', 'gaming', 'football', 'cinema', 'Xbox'],
      tags: ['friendly', 'proGamer', 'marvelFan', 'teen', 'yes', 'other'],
      image: 'assets/profilepic2.png'
  );


  final AssetImage profilePic = const AssetImage('assets/profilepic2.png');
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
              padding: EdgeInsets.fromLTRB(0, screenHeight*0.2-72, 0, 0),
              child: Center(
                child: Column(
                  children: [
                    AvatarContainer(profilePic),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                      child: Text(user_details.name, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xff1a1a1a))),
                    ),
                    Stars(user_details.rating),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(onTap: (){}, child: CardProfile(user_details.activicompleted.toString(), 'Activities Completed')),
                          InkWell(onTap: (){}, child: CardProfile(user_details.friends.toString(), 'Friends')),
                          InkWell(onTap: (){}, child: CardProfile(user_details.favcategory, 'Favorite Category')),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('About', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            Text(user_details.about)
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Align(alignment: Alignment.centerLeft,child: Text("Interests", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: IntOrTags(user_details.interests),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Align(alignment: Alignment.centerLeft,child: Text("Tags", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: IntOrTags(user_details.tags),
                    ),
                  ],
                ),
              ),
            ),
              Padding(
                  padding: EdgeInsets.fromLTRB(10, 50, 0, 0),
                  child: InkWell(
                    child: SizedBox(width: 40, height: 40, child: Image.asset('assets/left-arrow.png')),
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                  )
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(screenWidth - 50, 50, 0, 0),
                child: InkWell(
                  child: SizedBox(width: 40, height: 40, child: Image.asset('assets/instagram.png')),
                )
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(screenWidth - 100, 50, 0, 0),
                  child: InkWell(
                    child: SizedBox(width: 40, height: 40, child: Image.asset('assets/facebook.png')),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
