import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_project/Views/Widgets/containerhistory.dart';
import 'package:my_project/darius_mock_models/remote_service_singular_object.dart';
import 'Classes/activitydetails.dart';
import 'package:my_project/darius_mock_models/remote_service_list_objects.dart';
import 'dart:developer' as developer;
import 'Widgets/loadingscreen.dart';
import 'rate_activity.dart';
import 'Classes/User.dart';
import 'Classes/ActivityHistory.dart';

class ActivityHistoryPage extends StatefulWidget {
  ActivityHistoryPage({Key? key}) : super(key: key);

  @override
  _ActivityHistoryPageState createState() => _ActivityHistoryPageState();
}

class _ActivityHistoryPageState extends State<ActivityHistoryPage> {
  List<ActivityHistory>? activities = [];
  List<User> mock_user_list = [
    User(name: "Darius Coman", rating: 4.0, activicompleted: 12, friends: 0, favcategory: "Sport", about: 'about', interests: [''], tags: [''], friends_list: [''], age: 12),
    User(name: "Darius Andei", rating: 4.0, activicompleted: 12, friends: 0, favcategory: "Sport", about: 'about', interests: [''], tags: [''], friends_list: [''], age: 13),
    User(name: "Ramin Djwawadi", rating: 4.0, activicompleted: 12, friends: 0, favcategory: "Sport", about: 'about', interests: [''], tags: [''], friends_list: [''], age: 21),
  ];
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    final activityData = await fetchEventHistoryData();

    setState(() {
      activities = activityHistoryFromJson(json.encode(activityData));
      isLoaded = true;
    });
  }

  void _onBackPressed() {
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoadingScreenPage()));
  }

  @override
  Widget build(BuildContext context) {
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
      body: Visibility(
        visible: isLoaded,
        replacement: Center(child: const CircularProgressIndicator()),
        child: ListView.builder(
          itemCount: activities?.length ?? 0,
          itemBuilder: (context, index) {
            final activity = activities![index];
            return ContainerActivity(
              activity.date,
              activity.title,
              activity.tags,
              activity.nrParticipants,
              activity.category,
              activity.avgUserRating,
              activity.address,
              activity.description,
              RateActivity(activity, mock_user_list),
              activity.location
            );
          },
        ),
      ),
    );
  }
}

