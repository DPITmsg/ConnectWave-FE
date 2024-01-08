import 'package:flutter/material.dart';
import 'package:my_project/Views/Widgets/containeractivityHARDCODED.dart';
import 'package:my_project/Views/Widgets/containerhistory.dart';

import 'Classes/ActivityHistory.dart';
import 'Classes/User.dart';
import 'Widgets/loadingscreen.dart';
import 'rate_activity.dart';

class ActivityHistoryPage extends StatefulWidget {
  final List<ActivityHistory>? activities;
  final User? user;
  final bool isUser;

  ActivityHistoryPage({Key? key, required this.activities, required this.user, required this.isUser}) : super(key: key);

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
      body: widget.activities!.length != 0 ? ListView.builder(
        itemCount: widget.activities?.length ?? 0,
        itemBuilder: (context, index) {
          final activity = widget.activities![index];
          print(activity.id);
          if (widget.isUser) {
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
          }
          else{
            return ContainerActivityHardCoded(
                activity.date,
                activity.title,
                activity.tags,
                activity.participants.length,
                activity.category,
                activity.avgUserRating,
                activity.address,
                activity.description,
                activity.location);
          }
        },
      ): Center(child: Text('No activities completed!'),)
    );
  }
}

