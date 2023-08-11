import 'package:flutter/material.dart';
import 'package:my_project/Views/Widgets/containerhistory.dart';
import 'Classes/activitydetails.dart';
import 'package:my_project/darius_mock_models/post.dart';
import 'package:my_project/darius_mock_models/remote_service.dart';
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
    try {
      activities = await RemoteService().getActivities();
      if (activities != null) {
        setState(() {
          isLoaded = true;
        });
      }
    } catch (error) {
      print("Error fetching activities: $error");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Activity History"),
        backgroundColor: Color(0xffc9cfcf),
      ),
      body: ListView.builder(
        itemCount: 1,
          itemBuilder: (context, index){
            return ContainerActivity(activities!.first.date, activities!.first.title, activities!.first.tags, activities!.first.nrParticipants, activities!.first.category, activities!.first.avgUserRating, activities!.first.address, activities!.first.description);
          }
      ),
    );
  }
}
