import 'package:flutter/material.dart';
import 'stars.dart';
import '../Classes/activitydetails.dart';
import 'tags.dart';

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

  List<String> elementList = ["football", "fun"];

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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(date),
                    Text(title, style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage('assets/mapimg.png')),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 3),
                        )
                      ]
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Tags(elementList),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Text("Participants", style: TextStyle(color: Color(0xff45bac4), fontWeight: FontWeight.bold, fontSize: 16),),
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Text(nrParticipants.toString(), style: TextStyle(fontSize: 16),),
                            ),
                          ]
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                            children: [
                              Text("Category", style: TextStyle(color: Color(0xff45bac4), fontWeight: FontWeight.bold, fontSize: 16),),
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                child: Text(category, style: TextStyle(fontSize: 16),),
                              ),
                            ]
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(address),
                  Column(
                    children: [
                      Text("Average rating received"),
                      Stars(userRating),
                    ],
                  ),
                ],
              ),
              Align(alignment: Alignment.bottomLeft, child: Text("About", style: TextStyle(fontWeight: FontWeight.bold),)),
              Text(description)
            ],
          ),
        ),
      ),
    );
  }
}
