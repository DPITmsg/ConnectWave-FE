import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_project/Views/Styles/Shadows.dart';
import 'package:my_project/Views/Styles/StyleText.dart';

import '../Classes/activitydetails.dart';
import '../Styles/Gradients.dart';
import '../detailed_activity_page.dart';
import '../search_activity_map.dart';

class ContainerActivityForSearch extends StatelessWidget {
  ActivityDetails activity;

  ContainerActivityForSearch(this.activity);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => detailed_activity_page(activity)));
        },
        child: Container(
          width: screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: Gradient_Search_Activity,
            boxShadow: [
              Shadow_Darius
            ]
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(activity.title, style: Text_Search_Activity_v1,),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: InkWell(
                              onDoubleTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchActivityMap(locationTarget: activity.location, zoomLevel: 16)));
                              },
                              child: Container(
                                width: 150,
                                height: 150,
                                child: GoogleMap(
                                  rotateGesturesEnabled: false,
                                  scrollGesturesEnabled: false,
                                  zoomControlsEnabled: false,
                                  zoomGesturesEnabled: false,
                                  initialCameraPosition: CameraPosition(target: activity.location, zoom: 16),
                                  markers: {
                                    Marker(
                                      markerId: MarkerId('activity'),
                                      position: activity.location,
                                    )
                                  },
                                ),
                              ),
                            ),
                          ),
                          Text(activity.address, style: TextStyle(color: Colors.black.withOpacity(0.5)),),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0 ,0),
                        child: Column(
                          children: [
                            Text('Category: ${activity.category}', style: Text_Search_Activity_v2),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text('Nr. of participants: ${activity.nrParticipants.toString()}', style: Text_Search_Activity_v2),
                            ),
                            Text('${activity.date} - ${activity.endDate}', style: Text_Search_Activity_v2),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
