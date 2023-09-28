import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_project/Views/Widgets/containerhistory.dart';
import 'package:my_project/darius_mock_models/remote_service_singular_object.dart';
import 'Classes/activitydetails.dart';
import 'package:my_project/darius_mock_models/remote_service_list_objects.dart';
import 'dart:developer' as developer;
import 'Widgets/loadingscreen.dart';
import 'rate_activity.dart';
import 'Classes/User.dart';
import 'Classes/ActivityHistory.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Classes/Friend.dart';

class ActivityHistoryPage extends StatefulWidget {
  final List<ActivityHistory>? activities;
  final User? user;

  ActivityHistoryPage({Key? key, required this.activities, required this.user}) : super(key: key);

  @override
  _ActivityHistoryPageState createState() => _ActivityHistoryPageState();
}

class _ActivityHistoryPageState extends State<ActivityHistoryPage> {

  void _onBackPressed() {
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoadingScreenPage()));
  }

  @override
  Widget build(BuildContext context) {
    List<User> users = [widget.user!];
    return Scaffold(
      appBar: AppBar(
        title: Text("Activity History"),
        backgroundColor: Color(0xffc9cfcf),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            _onBackPressed();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: widget.activities?.length ?? 0,
        itemBuilder: (context, index) {
          final activity = widget.activities![index];
          print(activity.id);
          return ContainerActivity(
            activity.date,
            activity.title,
            activity.tags,
            activity.participants.length,
            activity.category,
            activity.avgUserRating,
            activity.address,
            activity.description,
            RateActivity(activity, users),
            activity.location
          );
        },
      ),
    );
  }
}

