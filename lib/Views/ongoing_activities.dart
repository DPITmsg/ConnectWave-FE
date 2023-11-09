
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_project/Views/Widgets/container_ongoing_activities.dart';
import 'package:my_project/Views/Widgets/loadingscreennopop.dart';

import '../darius_mock_models/remote_service_list_objects.dart';
import 'Classes/User.dart';
import 'Classes/activitydetails.dart';
import 'Styles/Colors.dart';
import 'Widgets/containersearchactivity.dart';
import 'Widgets/loadingscreen.dart';

class OngoingActivities extends StatefulWidget {
  final User? user;

  const OngoingActivities({super.key, required this.user});

  @override
  State<OngoingActivities> createState() => _OngoingActivitiesState();
}

class _OngoingActivitiesState extends State<OngoingActivities> {

  bool isLoaded = false;
  List<ActivityDetails> activitiesCurrent = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    print(widget.user!.activities_enrolled.length);
    activitiesCurrent = await fetchEnrolledActivitesData(widget.user!.activities_enrolled);
    setState(() {
      isLoaded = true;
    });
  }

  void _onBackPressed() {
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoadingScreenPage()));
  }

  void _removeActivity(ActivityDetails activity) {
    activitiesCurrent.remove(activity);
    setState(() {
    });
  }

  bool _isOnline(ActivityDetails activity){
    return activity.address != "online";
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded ? Scaffold(
      appBar: AppBar(
        title: Text("Ongoing Activities"),
        backgroundColor: Color_Blue,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            _onBackPressed();
          },
        ),
      ),
      body: Container(
        color: Color_Gray,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: activitiesCurrent.length ?? 0,
                itemBuilder: (context, index) {
                  final activity = activitiesCurrent[index];
                  return ContainerOngoingActivity(activity, widget.user!, _isOnline(activity), (){_removeActivity(activity);});
                },
              ),
            ),
          ],
        ),
      ),
    ): LoadingScreenPageNoPop();
  }
}





