import 'package:flutter/material.dart';
import 'containerhistory.dart';
import '../Classes/activitydetails.dart';

class ActivityHistoryPage extends StatelessWidget {

  final ActivityDetails activityDetails = ActivityDetails(
      date: '12-02-2023',
      title: 'Fotbal afara in casa la mac',
      tags: ['fotbal', 'begginner'],
      nrParticipants: 14,
      category: 'Sports',
      avgUserRating: 4.3,
      address: 'Str. Oarecare nr 23',
      description: 'Fotbal afara cu niste oameni am teren de fotbal smecher si va rog sa va aduceti papuci de sport ca sa nu stricam terenul'
  );

  ActivityHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Activity History"), backgroundColor: Color(0xffc9cfcf),),
      body: Container(
        color: Color(0xffc9cfcf),
        child: Column(
          children: [
            Expanded(flex: 1, child: SizedBox()),
            Expanded(flex: 15,child: ContainerActivity(
              activityDetails.date,
              activityDetails.title,
              activityDetails.tags,
              activityDetails.nrParticipants,
              activityDetails.category,
              activityDetails.avgUserRating,
              activityDetails.address,
              activityDetails.description,
            )),
            Expanded(flex: 15,child: ContainerActivity(
              activityDetails.date,
              activityDetails.title,
              activityDetails.tags,
              activityDetails.nrParticipants,
              activityDetails.category,
              activityDetails.avgUserRating,
              activityDetails.address,
              activityDetails.description,
            )),
          ],
        ),
      ),
    );
  }
}
