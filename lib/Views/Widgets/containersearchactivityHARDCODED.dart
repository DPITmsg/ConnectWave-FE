import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_project/Service/activity_service.dart';
import 'package:my_project/Views/Styles/Colors.dart';
import 'package:my_project/Views/Styles/Shadows.dart';
import 'package:my_project/Views/Styles/StyleText.dart';
import '../Classes/User.dart';

import '../Classes/activitydetails.dart';
import '../Styles/Gradients.dart';
import '../detailed_activity_page.dart';
import '../search_activity_map.dart';

class ContainerActivityForSearchHardCoded extends StatelessWidget {
  ActivityDetails activity;
  User user;
  bool isOnline;

  ContainerActivityForSearchHardCoded(this.activity, this.user, this.isOnline);

  bool _isOnline(ActivityDetails activity){
    return activity.address != "online";
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isFriend = user.friends.any((friend) => friend.name == activity.author || activity.participants.contains(friend.name));

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
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
              Row(
                  children: [
                    Expanded(
                      child: Text(
                        activity.title,
                        style: Text_Search_Activity_v1,
                        softWrap: true,
                      ),
                    ),
                    if (isFriend)
                      Icon(Icons.people, color: Color_Blue),
                  ]
              ),
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
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchActivityMap(locationTarget: activity.location, zoomLevel: 16, user: user)));
                            },
                            child: Container(
                              width: 150,
                              height: 150,
                              child: isOnline ? GoogleMap(
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
                              ): Container(width: 150, height: 150, child: Image(image: AssetImage('assets/online.png'),),),
                            ),
                          ),
                        ),
                        Container(
                            width: (screenWidth - 16) / 3,
                            child: Center(child: Text(activity.address, style: TextStyle(color: Colors.black.withOpacity(0.5)),))
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0 ,0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Category: ${activity.category}', style: Text_Search_Activity_v2),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text('Nr. of participants: ${activity.participants.length.toString()}', style: Text_Search_Activity_v2),
                          ),
                          Text(
                            activity.date != activity.endDate
                                ? '${activity.date} - ${activity.endDate}'
                                : activity.date,
                            style: Text_Search_Activity_v2,
                          ),
                          SizedBox(height: 5,),
                          Text('Author: ${activity.author}', style: Text_Search_Activity_v2),
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
    );
  }
}
