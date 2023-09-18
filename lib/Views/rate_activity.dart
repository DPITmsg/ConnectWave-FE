import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Classes/activitydetails.dart';
import 'Classes/User.dart';
import 'Widgets/interactive_stars.dart';
import 'Styles/StyleText.dart';
import 'Styles/Shadows.dart';
import 'Styles/Gradients.dart';
import 'Styles/Colors.dart';

class RateActivity extends StatelessWidget {
  ActivityDetails activity;
  List<User> participants;

  RateActivity(this.activity, this.participants);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text("Rate Activity & Participants"),),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color_White,
                boxShadow: [
                  Shadow_Darius
                ],
                gradient: LinearGradient(colors: [Color(0xffc9cfcf), Color(0xffefefef)], stops: [0.3,0.7]),
                borderRadius: BorderRadius.all(Radius.circular(16))
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(flex: 2, child: Text("Rate this activity", style: Text_Rate_Event,)),
                    Expanded(flex: 4,child: InteractiveStars()),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40,),
            Expanded(
              child: ListView.builder(
                itemCount: participants.length,
                itemBuilder: (builder, index){
                  User participant = participants[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color_White,
                          boxShadow: [
                            Shadow_Darius
                          ],
                          gradient: LinearGradient(colors: [Color(0xffc9cfcf), Color(0xffefefef)], stops: [0.3,0.7]),
                          borderRadius: BorderRadius.all(Radius.circular(16))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(flex: 2, child: Text(participant.name, style: Text_Rate_Event,)),
                          Expanded(flex: 4,child: InteractiveStars()),
                        ],
                      ),
                    ),
                  );
                }
              ),
            ),
            Center(
              child: TextButton(
                onPressed: (){},
                child: Container(
                  height: 42,
                  width: 128,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    boxShadow: [
                      Shadow_Darius
                    ],
                    color: Color_Blue,
                  ),
                  child: Center(child: Text("Submit", style: TextStyle(fontSize: 24, color: Color_White),)),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
