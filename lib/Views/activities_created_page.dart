import 'package:flutter/material.dart';
import 'package:my_project/Service/activity_service.dart';
import 'package:my_project/Views/Classes/Activity.dart';
import 'package:my_project/Views/Classes/User.dart';
import 'package:my_project/Views/Widgets/container_activities_created.dart';

import 'Classes/activitydetails.dart';
import 'Styles/Colors.dart';
import 'Widgets/containersearchactivity.dart';
import 'Widgets/loadingscreen.dart';

class ActivitiesCreatedPage extends StatefulWidget {
  final List<ActivityDetails> activities_created;
  final User user;
  final VoidCallback Function;

  const ActivitiesCreatedPage({Key? key, required this.activities_created, required this.user, required this.Function}) : super(key: key);

  @override
  State<ActivitiesCreatedPage> createState() => _ActivitiesCreatedPageState();
}


class _ActivitiesCreatedPageState extends State<ActivitiesCreatedPage> {
  void _onBackPressed() {
    Navigator.of(context).pop();
    widget.Function();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoadingScreenPage()));
  }

  bool _isOnline(ActivityDetails activity){
    return activity.address != "online";
  }

  void _removeActivity(ActivityDetails activity) async{
    deleteActivity(activity.id);
    setState(() {
      widget.activities_created.remove(activity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Created Activities"),
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
        child: widget.activities_created!.length != 0 ? Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: widget.activities_created.length,
                itemBuilder: (context, index) {
                  final activity = widget.activities_created[index];
                  return ContainerCreatedActivity(
                    activity: activity,
                    user: widget.user,
                    isOnline: _isOnline(activity),
                    removeActivity: () {
                      _removeActivity(activity);
                    },
                  );
                },
              ),
            ),
          ],
        ): Center(child: Text('No activities created!')),
      ),
    );
  }
}
