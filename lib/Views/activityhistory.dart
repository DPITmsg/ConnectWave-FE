import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_project/Views/Widgets/containerhistory.dart';
import 'Classes/activitydetails.dart';
import 'package:my_project/darius_mock_models/remote_service_list_objects.dart';
import 'dart:developer' as developer;

class ActivityHistoryPage extends StatefulWidget {
  ActivityHistoryPage({Key? key}) : super(key: key);

  @override
  _ActivityHistoryPageState createState() => _ActivityHistoryPageState();
}

class _ActivityHistoryPageState extends State<ActivityHistoryPage> {
  List<ActivityDetails>? activities = [];
  var isLoaded = false;

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
      appBar: AppBar(
        title: Text("Activity History"),
        backgroundColor: Color(0xffc9cfcf),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: Center(child: const CircularProgressIndicator()),
        child: ListView.builder(
          itemCount: activities?.length ?? 0,
          itemBuilder: (context, index) {
            final activity = activities![index];
            print(activities?.length);
            return ContainerActivity(
              activity.date,
              activity.title,
              activity.tags,
              activity.nrParticipants,
              activity.category,
              activity.avgUserRating,
              activity.address,
              activity.description,
            );
          },
        ),
      ),
    );
  }
}

