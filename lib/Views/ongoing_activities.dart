import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_project/Views/Styles/Colors.dart';
import 'Widgets/containerongoingactivities.dart';
import 'Classes/activitydetails.dart';
import '../darius_mock_models/remote_service_list_objects.dart';
import 'detailed_activity_page.dart';

class OngoingActivities extends StatefulWidget {
  const OngoingActivities({super.key});

  @override
  State<OngoingActivities> createState() => _OngoingActivitiesState();
}

class _OngoingActivitiesState extends State<OngoingActivities> {

  List<ActivityDetails> activities = [];
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    final activityData = await fetchEventData();

    setState(() {
      activities = activityFromJson(json.encode(activityData));
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Current Activities"), backgroundColor: Color_Gray),
      body: Visibility(
        visible: isLoaded,
        replacement: Center(child: const CircularProgressIndicator()),
        child: ListView.builder(
            itemCount: activities.length,
            itemBuilder: (context, index){
              final activity = activities[index];
              return ContainerOngoing(activity.title, activity.date, activity.author, activity.address, activity.nrParticipants, DetailedActivityPage(activity: activity,));
            },
        ),
      )
    );
  }
}
