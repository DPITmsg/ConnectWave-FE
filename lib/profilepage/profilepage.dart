import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_project/profilepage/avatarcontainer.dart';
import 'awesomegradient.dart';
import 'stars.dart';
import 'cardsprofilestats.dart';
import 'interestsortags.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class ProfilePage extends StatelessWidget {
  String name = "John Thomas";
  double rating = 4.0;
  List<String> elementList = ['Element 1', 'Element 2', 'Element 3'];
  String description = 'Hi, my name is John Thomas and I am 21. I live in Cluj Napoca but I was born on Mars. I am passionate about playing golf and gaming. I also won 3 marathons.';

  final AssetImage profilePic = const AssetImage('assets/profilepic2.png');
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: BoxDecoration(color: Color(0xffc9cfcf)),
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
                    child: Text(name, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xff1a1a1a))),
                  ),
                  Stars(rating),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CardProfile('12', 'Activities Completed'),
                        CardProfile('0', 'Friends'),
                        CardProfile('Sports', 'Favorite Category'),
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
                          Text(description)
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
                    child: IntOrTags(elementList),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Align(alignment: Alignment.centerLeft,child: Text("Tags", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: IntOrTags(elementList),
                  ),
                ],
              ),
            ),
          ),
            Padding(
                padding: EdgeInsets.fromLTRB(10, 50, 0, 0),
                child: InkWell(
                  child: SizedBox(width: 40, height: 40, child: Image.asset('assets/left-arrow.png')),
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
    );
  }
}
