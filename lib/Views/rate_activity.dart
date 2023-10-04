import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_project/Views/Widgets/container_rate_activity.dart';
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
      appBar: AppBar(
        title: Text("Rate Activity & Participants"),
      ),
      body: Builder(
        // Create a Builder widget to access the ScaffoldMessenger
        builder: (BuildContext scaffoldContext) {
          return Container(
            width: screenWidth,
            height: screenHeight,
            color: Color_Gray,
            child: Column(
              children: [
                SizedBox(height: 10,),
                ContainerRateActivity("Rate This Activity", "activity"),
                SizedBox(height: 40,),
                Expanded(
                  child: ListView.builder(
                      itemCount: participants.length,
                      itemBuilder: (builder, index){
                        User participant = participants[index];
                        return ContainerRateActivity(participant.name, "image goes here");
                      }
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      // Show a Snackbar
                      ScaffoldMessenger.of(scaffoldContext).showSnackBar(
                        SnackBar(
                          content: Text('Successful'),
                          duration: Duration(seconds: 2),
                        ),
                      );

                      Navigator.of(context).pop(); // Pop the top page
                      Navigator.of(context).pop(); // Pop one more page
                    },
                    child: Container(
                      height: 42,
                      width: 128,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        boxShadow: [Shadow_Darius],
                        color: Color_Blue,
                      ),
                      child: Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(fontSize: 24, color: Color_White),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
