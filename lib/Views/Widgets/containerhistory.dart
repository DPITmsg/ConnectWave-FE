import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Views/Widgets/tags.dart';
import '../Styles/Shadows.dart';
import 'stars.dart';

class ContainerActivity extends StatelessWidget {
  final String date;
  final String title;
  final List<String> tags;
  final int nrParticipants;
  final String category;
  final double userRating;
  final String address;
  final String description;
  Widget? child;
  final LatLng location;

  ContainerActivity(this.date, this.title, this.tags, this.nrParticipants, this.category, this.userRating, this.address, this.description, this.child, this.location);


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Container(
        width: screenWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffc9cfcf), Color(0xffeeeeee)],
            stops: [0.3, 0.6],
            transform: GradientRotation(11),
          ),
          boxShadow: [
            Shadow_Darius
          ]
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(date),
                              Text(title, softWrap: true, style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                ),
                              ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
                child: Tags(tags),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      child: Container(
                        width: 150,
                        height: 150,
                        child: GoogleMap(
                          rotateGesturesEnabled: false,
                          scrollGesturesEnabled: false,
                          zoomControlsEnabled: false,
                          zoomGesturesEnabled: false,
                          initialCameraPosition: CameraPosition(
                            zoom: 15,
                            target: location,
                          ),
                          markers: {
                            Marker(
                              markerId: MarkerId("activity"),
                              position: location,
                            ),
                          },
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(address, style: TextStyle(color: Colors.black.withOpacity(0.5)),),
                  Column(
                    children: [
                      Text("Average rating received", style: TextStyle(fontWeight: FontWeight.bold),),
                      Stars(userRating),
                    ],
                  ),
                ],
              ),
              Align(alignment: Alignment.bottomLeft, child: Text("About", style: TextStyle(fontWeight: FontWeight.bold),)),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Text(description),
              ),
              TextButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => child!));
                  },
                child: Text("Rate event & participants"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
