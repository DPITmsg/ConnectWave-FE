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

class ActivityHistoryPage extends StatefulWidget {
  ActivityHistoryPage({Key? key}) : super(key: key);

  @override
  _ActivityHistoryPageState createState() => _ActivityHistoryPageState();
}

class _ActivityHistoryPageState extends State<ActivityHistoryPage> {
  List<ActivityHistory>? activities = [];
  ActivityDetails mock_activity = ActivityDetails(id: 1, date: '24-02-2022', endDate: '23-02-2023', time: '14:00', author: 'es', title: 'da', tags: ['tes'], nrParticipants: 12, category: 'dwas', address: 'dwasd', description: 'description', location: LatLng(12.0, 12.0));
  List<User> mock_user_list = [
    User(name: "Darius Coman", rating: 4.0, activicompleted: 12, friends: 0, favcategory: "Sport", about: 'about', interests: [''], tags: [''], friends_list: [''], age: 12, activities_created: [ActivityDetails(id: 1, date: '24-02-2022', endDate: '23-02-2023', time: '14:00', author: 'es', title: 'da', tags: ['tes'], nrParticipants: 12, category: 'dwas', address: 'dwasd', description: 'description', location: LatLng(12.0, 12.0))], activities_enrolled: [ActivityDetails(id: 1, date: '24-02-2022', endDate: '23-02-2023', time: '14:00', author: 'es', title: 'da', tags: ['tes'], nrParticipants: 12, category: 'dwas', address: 'dwasd', description: 'description', location: LatLng(12.0, 12.0))], username: "f"),
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

