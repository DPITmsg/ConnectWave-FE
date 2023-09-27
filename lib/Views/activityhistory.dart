import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_project/Views/Widgets/containerhistory.dart';

import 'Classes/ActivityHistory.dart';
import 'Classes/User.dart';
import 'Classes/activitydetails.dart';
import 'Widgets/loadingscreen.dart';
import 'rate_activity.dart';

class ActivityHistoryPage extends StatefulWidget {
  final List<ActivityHistory>? activities;

  ActivityHistoryPage({Key? key, required this.activities}) : super(key: key);

  @override
  _ActivityHistoryPageState createState() => _ActivityHistoryPageState();
}

class _ActivityHistoryPageState extends State<ActivityHistoryPage> {
  List<User> mock_user_list = [
    User(name: "Darius Coman", rating: 4.0, about: 'about', interests: [''], tags: [''], pfp: '', age: 12, activities_created: [ActivityDetails(id: 1, date: '24-02-2022', endDate: '23-02-2023', time: '14:00', author: 'es', title: 'da', tags: ['tes'], participants: [], category: 'dwas', address: 'dwasd', description: 'description', maxParticipants: 10, location: LatLng(12.0, 12.0))], activities_enrolled: [ActivityDetails(id: 1, date: '24-02-2022', endDate: '23-02-2023', time: '14:00', author: 'es', title: 'da', tags: ['tes'], participants: [], category: 'dwas', address: 'dwasd', description: 'description', maxParticipants: 10, location: LatLng(12.0, 12.0))], activities_completed: [ActivityHistory(id: 1, date: '24-02-2022', endDate: '23-02-2023', time: '14:00', author: 'es', title: 'da', tags: ['tes'], participants: [], category: 'dwas', address: 'dwasd', description: 'description', maxParticipants: 10, location: LatLng(12.0, 12.0), avgUserRating: 0.5)], username: "f", friends: []),
  ];

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
      body: ListView.builder(
        itemCount: widget.activities?.length ?? 0,
        itemBuilder: (context, index) {
          final activity = widget.activities![index];
          return ContainerActivity(
            activity.date,
            activity.title,
            activity.tags,
            activity.participants.length,
            activity.category,
            activity.avgUserRating,
            activity.address,
            activity.description,
            RateActivity(activity, mock_user_list),
            activity.location
          );
        },
      ),
    );
  }
}

