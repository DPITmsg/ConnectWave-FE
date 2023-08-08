import 'package:flutter/material.dart';
import 'stars.dart';
import '../Classes/activitydetails.dart';

class ContainerActivity extends StatelessWidget {
  final String date;
  final String title;
  final List<String> tags;
  final int nrParticipants;
  final String category;
  final double userRating;
  final String address;
  final String description;

  ContainerActivity(this.date, this.title, this.tags, this.nrParticipants, this.category, this.userRating, this.address, this.description);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Container(
        width: screenWidth,
        height: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffc9cfcf), Color(0xffeeeeee)],
            stops: [0.3, 0.6],
            transform: GradientRotation(11),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0,3)
            )
          ]
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(date),
                Text(title, style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(radius: 72, backgroundColor: Colors.black),
                Column(
                  children: [
                    Row(
                      children: [
                        Text("Participants", style: TextStyle(color: Color(0xff45bac4), fontWeight: FontWeight.bold),),
                        Text(nrParticipants.toString()),
                      ]
                    ),
                    Row(
                        children: [
                          Text("Category", style: TextStyle(color: Color(0xff45bac4), fontWeight: FontWeight.bold),),
                          Text(category),
                        ]
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(address),
                Stars(userRating),
              ],
            ),
            Text("About"),
            Text(description)
          ],
        ),
      ),
    );
  }
}
