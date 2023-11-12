
import 'package:flutter/material.dart';
import 'package:my_project/Service/activity_service.dart';
import 'package:my_project/Views/Widgets/container_ongoing_activities.dart';
import 'package:my_project/Views/Widgets/containersearchactivity.dart';
import 'package:my_project/Views/Widgets/loadingscreennopop.dart';

import '../Service/friend_list_service.dart';
import '../darius_mock_models/remote_service_list_objects.dart';
import 'Classes/User.dart';
import 'Classes/activitydetails.dart';
import 'Styles/Colors.dart';
import 'Widgets/loadingscreen.dart';

class CreatedActivitiesHardCoded extends StatefulWidget {
  User? userObserved;

  CreatedActivitiesHardCoded({super.key, required this.userObserved});

  @override
  State<CreatedActivitiesHardCoded> createState() => _CreatedActivitiesHardCodedState();
}

class _CreatedActivitiesHardCodedState extends State<CreatedActivitiesHardCoded> {

  bool isLoaded = false;
  List<ActivityDetails> activitiesCreated = [];

  @override
  void initState() {
    super.initState();
    getActivitesCreated();

    isLoaded = true;
  }

  getActivitesCreated() async{
    List<int> ids = widget.userObserved!.activities_created;
    List<ActivityDetails> tempActivitiesCreated = await fetchEnrolledActivitesData(ids);

    setState(() {
      activitiesCreated = tempActivitiesCreated;
    });
  }

  void _onBackPressed() {
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoadingScreenPage()));
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
                itemCount: activitiesCreated.length ?? 0,
                itemBuilder: (context, index) {
                  final activity = activitiesCreated[index];
                  return ContainerActivityForSearch(activity, widget.userObserved!, _isOnline(activity));
                },
              ),
            ),
          ],
        ),
      ),
    ): LoadingScreenPageNoPop();
  }
}





